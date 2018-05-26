#include <R.h>
#include <R_ext/RdynLoad.h>

void paretodens(double *x, double *alpha, double *x_m,
                int *input_len, int *max_len, int *is_log,
                double *density)
{
  int i, n, x_len, alpha_len, x_m_len, IsLog;

  n = *max_len;
  IsLog = *is_log;
  x_len = input_len[0];
  alpha_len = input_len[1];
  x_m_len = input_len[2];

  for (i=0; i < n; i++) {
    density[i] = R_NegInf;
  }

  for (i=0; i < n; i++) {
    if (alpha[i % alpha_len] <= 0.0 || x_m[i % x_m_len] <= 0.0) {
      density[i] = R_NaN;
    } else if (x[i % x_len] >= x_m[i % x_m_len]) {
      density[i] = log(alpha[i % alpha_len]) + alpha[i % alpha_len] * log(x_m[i % x_m_len]) - (alpha[i % alpha_len] + 1.0) * log(x[i % x_len]);
    }
  }

  if (!IsLog) {
    for ( i = 0; i < n; i++) {
      density[i] = exp(density[i]);
    }
  }
}

static const R_CMethodDef cMethods[] = {
  {"paretodens", (DL_FUNC) &paretodens, 7},
  {NULL, NULL, 0, NULL}
};

void R_init_paretoRoutines(DllInfo *info) {
  R_registerRoutines(info, cMethods, NULL, NULL, NULL);
  R_useDynamicSymbols(info, FALSE);
}
