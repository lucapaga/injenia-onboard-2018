. ../01-setup/00_set_params.sh

# PREPARE YOUR TABLE CONSIDERING YOU'LL HAVE THE FOLLOWING FEATURES:
#  - message: kind of free-text
#  - city: the familiar name of a city in the world, e.g.: Modena
#  - temperature: a decimal value from -20 to +40
#  - hour: an hour of the day (1-based)
#  - day: a day of the month (1-based)
#  - month: a month (1-based)
#  - year: year
bq mk -t $table message:STRING,city:STRING,temperature:float,hour:INTEGER,day:INTEGER,month:INTEGER,year:INTEGER

