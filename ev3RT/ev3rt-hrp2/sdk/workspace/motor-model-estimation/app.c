// This sample program shows how to create and control periodic tasks in EV3RT

#include "ev3api.h"
#include "app.h"
#include <stdlib.h>

static int32_t fontw, fonth;
static int motor_cnt = 0;
static int power = 0;
static int task_cnt = 0;

/**
 * Define the connection ports of the sensors and motors.
 * By default, this application uses the following ports:
 * Left motor:   Port B
 */
const int left_motor = EV3_PORT_B;

// a cyclic handler to activate a task
void task_activator(intptr_t tskid) {
    ER ercd = act_tsk(tskid);
    assert(ercd == E_OK);
}

// Print start time of a task
static void draw_start_time(int index) {
    SYSTIM tim;
    get_tim(&tim); // get system time in ms

    int x = 0, y = fonth * (1 + index);
    ev3_lcd_fill_rect(x, y, EV3_LCD_WIDTH, fonth, EV3_LCD_WHITE);
    char buf[100];
    sprintf(buf, " PRD_TSK_%d | %lu", index, tim);
    ev3_lcd_draw_string(buf, x, y);
}


// a periodic task
void periodic_task_1(intptr_t unused) {
    draw_start_time(1);
}

// a periodic task
void periodic_task_2(intptr_t unused) {
    draw_start_time(2);
    char buf[100];

    // read motor counts
    motor_cnt = ev3_motor_get_counts(left_motor);
    sprintf(buf, "MOTOR_CNT: %d", motor_cnt);
    ev3_lcd_draw_string(buf, 0, fonth * 7);

    sprintf(buf, "TASK_CNT: %d", task_cnt);
    ev3_lcd_draw_string(buf, 0, fonth * 8);

    sprintf(buf, "POWER: %d", power);
    ev3_lcd_draw_string(buf, 0, fonth * 9);

    ev3_motor_set_power(left_motor, power);
    if(power > -100 && power < 100){
      power++;
      task_cnt++;
      }
    else{
      power = 0;
      task_cnt = 0;
	}
}




void main_task(intptr_t unused) {
    // Configure motors
    ev3_motor_config(left_motor, LARGE_MOTOR);
    ev3_lcd_set_font(EV3_FONT_SMALL);
    ev3_font_get_size(EV3_FONT_SMALL, &fontw, &fonth);
    ev3_lcd_draw_string("  TASK ID  | START TIME", 0, fonth * 1);

    for (bool_t start_prd_tsk_2 = false;;) {
        ev3_lcd_fill_rect(0, fonth * 4, EV3_LCD_WIDTH, fonth, EV3_LCD_WHITE);
        if (!start_prd_tsk_2){
          ev3_lcd_draw_string("ENTER button: start PRD_TSK_2", 0, fonth * 5);
        }
        else{
          ev3_lcd_draw_string("ENTER button: stop  PRD_TSK_2", 0, fonth * 5);
        }

        // Wait for a click
        while(!ev3_button_is_pressed(ENTER_BUTTON));
        while(ev3_button_is_pressed(ENTER_BUTTON));

        start_prd_tsk_2 = !start_prd_tsk_2;
        if (start_prd_tsk_2)
            ev3_sta_cyc(CYC_PRD_TSK_2);
        else
            ev3_stp_cyc(CYC_PRD_TSK_2);
    }
}
