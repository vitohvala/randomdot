#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    int bat_perc;
    
    char batterry_icon[][11] =          {"󱃍","󰁺", "󰁺", "󰁼", "󰁽","󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"};
 /* char batterry_icon_charging[][11] = {"󰢟","󰢜", "󰂆", "󰂇", "󰂈","󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"};*/
    char bolt[] = "󱐋";

    char indeks, status_ch[20];

    FILE *fajl;

    fajl = fopen("/sys/class/power_supply/BAT0/capacity", "r");

    if(fajl == NULL){
        perror("Error");
        return (1);
    }

    fscanf(fajl, "%d", &bat_perc);
    
    fclose(fajl);

    indeks = bat_perc / 10;
    if(bat_perc > 100)
        indeks = 10;

    fajl = fopen("/sys/class/power_supply/BAT0/status", "r");
   
     if(fajl == NULL){
        perror("Error");
        return (1);
    }

    if(fgets(status_ch, 20, fajl) == NULL){
        perror("Error");
        fclose(fajl);
        return 1;
    }
    status_ch[strcspn(status_ch, "\n")] = '\0';
    fclose(fajl);

    if(!(strcmp(status_ch, "Charging"))){
        strcat(batterry_icon[indeks], bolt);    
    }
    puts(batterry_icon[indeks]);

    return 0;
}
