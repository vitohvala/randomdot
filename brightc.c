#include <stdio.h>
#include <string.h>

/*
 * Treba SUDO!
 *
 *
 * 
*/

int main(int argc, char *argv[]){
    if(argc == 1) {
        return 1;
    }
    if((strcmp(argv[1], "+") == 0 && argc < 3) || (strcmp(argv[1], "-") == 0 && argc < 3)){

        FILE *f_brightness;
        f_brightness = fopen("/sys/class/backlight/intel_backlight/brightness", "r");
        
        if(f_brightness == NULL){
            perror("Nije Moguce Otvoriti /sys/class/backlight/intel_backlight/brightness\nError: ");
            return 0;
        }
        
        int val;
        fscanf(f_brightness, "%d", &val);
        
        fclose(f_brightness);

        f_brightness = fopen("/sys/class/backlight/intel_backlight/brightness", "w");

        val = (!(strcmp(argv[1], "+"))) ? val + 50 : val  - 50;

        fprintf(f_brightness, "%d", val);
        
        fclose(f_brightness);
    }
    else 
        return 1;
    return 0;
}
