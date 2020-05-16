/*
 * motorModelEstimation.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "motorModelEstimation".
 *
 * Model version              : 1.22
 * Simulink Coder version : 9.1 (R2019a) 23-Nov-2018
 * C source code generated on : Sat May 16 18:11:56 2020
 *
 * Target selection: ert.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: ARM Compatible->ARM 9
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "motorModelEstimation.h"
#include "motorModelEstimation_private.h"
#include "motorModelEstimation_dt.h"

/* Block signals (default storage) */
B_motorModelEstimation_T motorModelEstimation_B;

/* Block states (default storage) */
DW_motorModelEstimation_T motorModelEstimation_DW;

/* Real-time model */
RT_MODEL_motorModelEstimation_T motorModelEstimation_M_;
RT_MODEL_motorModelEstimation_T *const motorModelEstimation_M =
  &motorModelEstimation_M_;

/* Model step function */
void motorModelEstimation_step(void)
{
  real_T currentTime;
  int8_T tmp;

  /* Step: '<Root>/Step' */
  currentTime = motorModelEstimation_M->Timing.taskTime0;
  if (currentTime < motorModelEstimation_P.Step_Time) {
    motorModelEstimation_B.Step = motorModelEstimation_P.Step_Y0;
  } else {
    motorModelEstimation_B.Step = motorModelEstimation_P.Step_YFinal;
  }

  /* End of Step: '<Root>/Step' */

  /* S-Function (ev3_encoder): '<Root>/Encoder' */
  motorModelEstimation_B.sensorSignals = getEncoderValueNoReset(1U);

  /* DataTypeConversion: '<S1>/Data Type Conversion' incorporates:
   *  Sum: '<Root>/Sum'
   */
  currentTime = floor(motorModelEstimation_B.Step - (real_T)
                      motorModelEstimation_B.sensorSignals);
  if (currentTime < 128.0) {
    if (currentTime >= -128.0) {
      /* S-Function (ev3_motor): '<S1>/Motor' */
      tmp = (int8_T)currentTime;
    } else {
      /* S-Function (ev3_motor): '<S1>/Motor' */
      tmp = MIN_int8_T;
    }
  } else {
    /* S-Function (ev3_motor): '<S1>/Motor' */
    tmp = MAX_int8_T;
  }

  /* End of DataTypeConversion: '<S1>/Data Type Conversion' */

  /* S-Function (ev3_motor): '<S1>/Motor' */
  setMotor(&tmp, 1U, 2U);

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [0.1s, 0.0s] */
    rtExtModeUpload(0, (real_T)motorModelEstimation_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.1s, 0.0s] */
    if ((rtmGetTFinal(motorModelEstimation_M)!=-1) &&
        !((rtmGetTFinal(motorModelEstimation_M)-
           motorModelEstimation_M->Timing.taskTime0) >
          motorModelEstimation_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(motorModelEstimation_M, "Simulation finished");
    }

    if (rtmGetStopRequested(motorModelEstimation_M)) {
      rtmSetErrorStatus(motorModelEstimation_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++motorModelEstimation_M->Timing.clockTick0)) {
    ++motorModelEstimation_M->Timing.clockTickH0;
  }

  motorModelEstimation_M->Timing.taskTime0 =
    motorModelEstimation_M->Timing.clockTick0 *
    motorModelEstimation_M->Timing.stepSize0 +
    motorModelEstimation_M->Timing.clockTickH0 *
    motorModelEstimation_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void motorModelEstimation_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)motorModelEstimation_M, 0,
                sizeof(RT_MODEL_motorModelEstimation_T));
  rtmSetTFinal(motorModelEstimation_M, -1);
  motorModelEstimation_M->Timing.stepSize0 = 0.1;

  /* External mode info */
  motorModelEstimation_M->Sizes.checksums[0] = (2391727121U);
  motorModelEstimation_M->Sizes.checksums[1] = (574667379U);
  motorModelEstimation_M->Sizes.checksums[2] = (945483668U);
  motorModelEstimation_M->Sizes.checksums[3] = (1090510143U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    motorModelEstimation_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(motorModelEstimation_M->extModeInfo,
      &motorModelEstimation_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(motorModelEstimation_M->extModeInfo,
                        motorModelEstimation_M->Sizes.checksums);
    rteiSetTPtr(motorModelEstimation_M->extModeInfo, rtmGetTPtr
                (motorModelEstimation_M));
  }

  /* block I/O */
  (void) memset(((void *) &motorModelEstimation_B), 0,
                sizeof(B_motorModelEstimation_T));

  /* states (dwork) */
  (void) memset((void *)&motorModelEstimation_DW, 0,
                sizeof(DW_motorModelEstimation_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    motorModelEstimation_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Start for S-Function (ev3_encoder): '<Root>/Encoder' */
  initEncoder(1U);

  /* Start for S-Function (ev3_motor): '<S1>/Motor' */
  initMotor(1U);
}

/* Model terminate function */
void motorModelEstimation_terminate(void)
{
  /* Terminate for S-Function (ev3_encoder): '<Root>/Encoder' */
  terminateEncoder(1U);

  /* Terminate for S-Function (ev3_motor): '<S1>/Motor' */
  terminateMotor(1U, 2U);
}
