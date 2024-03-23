/// Log the time it takes to execute the given expression.
#[macro_export]
macro_rules! time {
    ($level:expr, $what:literal, || $e:expr) => {{
        let timer = if $crate::private::tracing::enabled!($level) {
            Some(std::time::Instant::now())
        } else {
            None
        };
        let res = $e;
        // $crate::private::tracing::event!($level, elapsed=?timer.unwrap().elapsed(), $what);
        $crate::private::tracing::event!($level, "{:>10?} - {}", timer.unwrap().elapsed(), $what);
        res
    }};
}

/// Log the time it takes to execute the given expression at `debug` level.
#[macro_export]
macro_rules! debug_time {
    ($what:literal, || $e:expr) => {
        $crate::time!($crate::private::tracing::Level::DEBUG, $what, || $e)
    };
}

/// Log the time it takes to execute the given expression at `trace` level.
#[macro_export]
macro_rules! trace_time {
    ($what:literal, || $e:expr) => {
        $crate::time!($crate::private::tracing::Level::TRACE, $what, || $e)
    };
}