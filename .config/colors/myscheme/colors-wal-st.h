const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c2319", /* black   */
  [1] = "#c14d38", /* red     */
  [2] = "#a0ce52", /* green   */
  [3] = "#be9e61", /* yellow  */
  [4] = "#4c7e89", /* blue    */
  [5] = "#814d61", /* magenta */
  [6] = "#79a69d", /* cyan    */
  [7] = "#bcbebb", /* white   */

  /* 8 bright colors */
  [8]  = "#35422f",  /* black   */
  [9]  = "#c14d38",  /* red     */
  [10] = "#a0ce52", /* green   */
  [11] = "#be9e61", /* yellow  */
  [12] = "#4c7e89", /* blue    */
  [13] = "#814d61", /* magenta */
  [14] = "#79a69d", /* cyan    */
  [15] = "#bcbebb", /* white   */

  /* special colors */
  [256] = "#1c2319", /* background */
  [257] = "#be9e61", /* foreground */
  [258] = "#bcbebb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
