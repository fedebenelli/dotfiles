static const char norm_fg[] = "#c5c6e7";
static const char norm_bg[] = "#0F1624";
static const char norm_border[] = "#898aa1";

static const char sel_fg[] = "#c5c6e7";
static const char sel_bg[] = "#0c21ec";
static const char sel_border[] = "#c5c6e7";

static const char urg_fg[] = "#c5c6e7";
static const char urg_bg[] = "#0c1dee";
static const char urg_border[] = "#0c1dee";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
