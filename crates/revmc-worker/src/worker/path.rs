use std::path::PathBuf;

use chrono::Utc;

#[inline]
fn default_path() -> PathBuf {
    let home_dir = std::env::var("HOME").unwrap_or_else(|_| ".".to_string());
    PathBuf::from(home_dir).join(".aotstore")
}

#[inline]
pub fn aot_store_path() -> PathBuf {
    default_path().join("output")
}

#[inline]
pub fn sleddb_path() -> PathBuf {
    default_path().join("db")
}

#[inline]
pub fn log_path() -> PathBuf {
    let timestamp = Utc::now().format("%Y-%m-%d-%H-%M-%S %z").to_string();
    let file = format!("{timestamp}.log");
    default_path().join("log").join(file)
}
