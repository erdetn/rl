// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module log

pub enum TraceLogLevel {
    all = C.LOG_ALL 
    trace = C.LOG_TRACE
    debug = C.LOG_DEBUG
    info = C.LOG_INFO
    warning = C.LOG_WARNING
    error = C.LOG_ERROR
    fatal = C.LOG_FATAL
    @none = C.LOG_NONE          
} 

fn C.TraceLog(log_level int, text &char)
pub fn trace(level TraceLogLevel, text string) {
    unsafe {
        C.TraceLog(int(level), &char(text.str))
    }
}

fn C.SetTraceLogLevel(log_level int)
pub fn set_level(level TraceLogLevel) {
    C.SetTraceLogLevel(int(level))
}
