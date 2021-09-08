const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F1624", /* black   */
  [1] = "#0c1dee", /* red     */
  [2] = "#0c21ec", /* green   */
  [3] = "#4051f4", /* yellow  */
  [4] = "#e118f2", /* blue    */
  [5] = "#4897f5", /* magenta */
  [6] = "#21d1f3", /* cyan    */
  [7] = "#c5c6e7", /* white   */

  /* 8 bright colors */
  [8]  = "#898aa1",  /* black   */
  [9]  = "#0c1dee",  /* red     */
  [10] = "#0c21ec", /* green   */
  [11] = "#4051f4", /* yellow  */
  [12] = "#e118f2", /* blue    */
  [13] = "#4897f5", /* magenta */
  [14] = "#21d1f3", /* cyan    */
  [15] = "#c5c6e7", /* white   */

  /* special colors */
  [256] = "#0F1624", /* background */
  [257] = "#c5c6e7", /* foreground */
  [258] = "#c5c6e7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
