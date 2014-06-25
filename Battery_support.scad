
batteryDiameter = 21;
batteryLenght = 35;


battery_support_x_length = (batteryDiameter * 4) + 7;
battery_support_y_length = 2;
battery_support_z_length = (batteryDiameter/2)-4;
battery_support_dimmensions=[battery_support_x_length,battery_support_y_length,battery_support_z_length];



difference_cube_x_lenght = battery_support_x_length;
difference_cube_y_lenght = batteryLenght + 2;
difference_cube_z_lenght= batteryDiameter + 7;
difference_cube_dimensions = [difference_cube_x_lenght,difference_cube_y_lenght,difference_cube_z_lenght];

final_box_dimensions = [difference_cube_x_lenght+4,difference_cube_y_lenght+4,difference_cube_z_lenght-1];

module Battery() {
	rotate([90, 0, 0])
	cylinder(r=batteryDiameter/2, h=35, $fn= 240, center = true);
}
 module BatterySupport() {
 	difference() {
 		cube(battery_support_dimmensions, center = false);
 		translate([ (batteryDiameter/2)+2 , 0, (batteryDiameter/2)+2])
 		batterySet();
	}
}

module batterySet(){
 	 	Battery();
 	  	translate([batteryDiameter + 1, 0, 0])
 	  	Battery();
	 	translate([(batteryDiameter * 2) + 2, 0, 0])
		Battery();
		translate([(batteryDiameter * 3) + 3, 0, 0])
		Battery();
}


module FinalBox() {
	difference() {
			cube(final_box_dimensions, center=false);
			translate([2, 2, 2])
			cube(difference_cube_dimensions, center=false);
	}
}

module top_part()
{
	cube([difference_cube_x_lenght+10,difference_cube_y_lenght+2,2]);
}

module BatteryHolder(){
	union() {
		difference() {
			FinalBox();
			translate([-4, 1, difference_cube_z_lenght-4])
			top_part();
		}
		translate([2, (difference_cube_y_lenght/3)-1, 1])
		BatterySupport();
		translate([2, ((difference_cube_y_lenght/3)*2)+1, 1])
		BatterySupport();	
	}

}


BatteryHolder();