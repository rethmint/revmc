use std::{ env, path::PathBuf, sync::Once };

use chrono::Utc;
use once_cell::sync::OnceCell;
use tracing_appender::{ non_blocking::WorkerGuard, rolling };
use tracing_subscriber::{ fmt, layer::SubscriberExt, EnvFilter, Registry };

use crate::log_path;

static TRACER_INIT: Once = Once::new();
static TRACER_GUARD: OnceCell<WorkerGuard> = OnceCell::new();

pub fn init_tracer() {
    TRACER_INIT.call_once(|| {
        let file = rolling::never(".", log_path());
        let (non_blocking, guard) = tracing_appender::non_blocking(file);

        TRACER_GUARD.set(guard).ok();

        let env_filter = EnvFilter::new("info");

        let format = fmt
            ::format()
            .with_level(true)
            .with_thread_ids(true)
            .with_file(true)
            .with_line_number(true)
            .compact();

        let subscriber = Registry::default()
            .with(env_filter)
            // async dump to log
            .with(
                fmt
                    ::layer()
                    .event_format(format)
                    .with_ansi(false)
                    .with_writer(non_blocking)
                    .with_target(false)
            )
            // console
            .with(fmt::layer().with_writer(std::io::stdout));

        tracing::debug!("Test log - debug");
        tracing::error!("Test log - error");
        tracing::info!("Test log - info");

        tracing::subscriber::set_global_default(subscriber).unwrap();
    });
}
