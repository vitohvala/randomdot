#include <stdio.h>
#include <stdlib.h>
#include <string.h>


static int getl(int number){
    int l = 1;
    while(number > 9){
        l++;
        number /= 10;
    }
    return l;
}

int main(){

    int bat_perc, bat_perc_len;
    
    char batterry_icon[][11] =          {"󱃍","󰁺", "󰁺", "󰁼", "󰁽","󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"};
 /* char batterry_icon_charging[][11] = {"󰢟","󰢜", "󰂆", "󰂇", "󰂈","󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"};*/
    char bolt[] = "󱐋";

    char indeks, * char_to_find, status_ch[20];

    FILE *fajl;

    fajl = fopen("/sys/class/power_supply/BAT0/capacity", "r");

    if(fajl == NULL){
        perror("Nije moguce otvoriti file /sys/class/power_supply/BAT0/capacity\nError: ");
        return (-1);
    }

    fscanf(fajl, "%d", &bat_perc);
    
    fclose(fajl);

    bat_perc_len = getl(bat_perc);

    indeks = bat_perc / 10;

    fajl = fopen("/sys/class/power_supply/BAT0/status", "r");
   
     if(fajl == NULL){
        perror("Nije moguce otvoriti file /sys/class/power_supply/BAT0/capacity\nError: ");
        return (-1);
    }

    
    while (fscanf(fajl,"%99[^\n] ", status_ch) == 1){
         
        char_to_find = status_ch;
        
        while(*char_to_find != 0){
            char_to_find++;
        }
        
        char_to_find--;
        
        if(*char_to_find == '5'){
            printf("%s\n", status_ch); 
        }
    }

    fclose(fajl);


//    (!(strcmp(status_ch, "Charging"))) ? puts(batterry_icon_charging[indeks]) : puts(batterry_icon[indeks]);

    if(!(strcmp(status_ch, "Charging"))){
        strcat(batterry_icon[indeks], bolt);    
    }
    puts(batterry_icon[indeks]);

    return 0;
}
