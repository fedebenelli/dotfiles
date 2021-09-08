static const char norm_fg[] = "#bcbebb";
static const char norm_bg[] = "#1c2319";
static const char norm_border[] = "#35422f";

static const char sel_fg[] = "#bcbebb";
static const char sel_bg[] = "#a0ce52";
static const char sel_border[] = "#bcbebb";

static const char urg_fg[] = "#bcbebb";
static const char urg_bg[] = "#c14d38";
static const char urg_border[] = "#c14d38";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
