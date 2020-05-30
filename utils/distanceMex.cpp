#include "mex.h"
#include <math.h>
#include <malloc.h>
#include <stdio.h>
#include "stdlib.h"
#include <assert.h>

#define min(a,b) a<b?a:b

double distance(double *vec1, double *vec2, int col, double distanceType)
{
	int i = 0;
	double d = 0;
	if (distanceType == 1)//histogram intersection distance
	{
		for (i = 0; i < col; i++)
		{
			d += min(*(vec1 + i), *(vec2 + i));
		}
		d = 1 - d;
	}
	else if (distanceType == 2)//Euclidean distance
	{
		for (i = 0; i < col; i++)
		{
			d += (*(vec1 + i) - *(vec2 + i)) * (*(vec1 + i) - *(vec2 + i));
		}
		d = sqrt(d);
	}
	return d;
}

void matrixDistance(double **data1, int row1, int col1, double **data2, int row2, int col2, double distanceType, double *res)
{
	int i = 0, j = 0;
	//col1 = col2;
	int col = col1;
	double maxD = 0, minD = 1;

	for (i = 0; i < row1; i++)
	for (j = 0; j < row2; j++)
	{
		*(res + i * row2 + j) = distance(data1[i], data2[j], col, distanceType);
		if (*(res + i * row2 + j) > maxD) maxD = *(res + i * row2 + j);
		if (*(res + i * row2 + j) < minD) minD = *(res + i * row2 + j);
	}
	for (i = 0; i < row1; i++)
	for (j = 0; j < row2; j++)
	{
		*(res + i * row2 + j) = (*(res + i * row2 + j) - minD) / (maxD - minD);
	}

}


void mexFunction(int nout, mxArray *out[], int nin, const mxArray *in[])
{
	int col1 = mxGetN(in[0]);
	int row1 = mxGetM(in[0]);

	double *rawData1 = mxGetPr(in[0]);

	int col2 = mxGetN(in[1]);
	int row2 = mxGetM(in[1]);

	double *rawData2 = mxGetPr(in[1]);

	double distanceType = *(double*)mxGetPr(in[2]);

	int i, j;
	double **data1;
	double **data2;

	double *res = NULL;//Êä³ö½á¹û

	data1 = (double **)malloc(sizeof(double*)*row1);
	for (i = 0; i < row1; i++)
		data1[i] = (double *)malloc(sizeof(double)*col1);

	data2 = (double **)malloc(sizeof(double*)*row2);
	for (i = 0; i < row2; i++)
		data2[i] = (double *)malloc(sizeof(double)*col2);

	for (i = 0; i<row1; i++)
	{
		for (j = 0; j<col1; j++)
		{
			data1[i][j] = rawData1[i + j*row1];
		}
	}

	for (i = 0; i<row2; i++)
	{
		for (j = 0; j<col2; j++)
		{
			data2[i][j] = rawData2[i + j*row2];
		}
	}

	out[0] = mxCreateDoubleMatrix(1, row1*row2, mxREAL);
	res = mxGetPr(out[0]);

	matrixDistance(data1, row1, col1, data2, row2, col2, distanceType, res);

	for (i = 0; i < row1; i++)
		free(data1[i]);
	free(data1);
	for (i = 0; i < row2; i++)
		free(data2[i]);
	free(data2);
	return;
}

