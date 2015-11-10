# This is to register the time date format in the global settings.
Date::DATE_FORMATS[:default] = '%d/%m/%Y'

# DateTime::DATE_FORMATS[:default]= '%d/%m/%Y %l:%M %p'
# this does not work but it good to know how to format datetime datatype

# if you want to change the format of Time display then add the line below
Time::DATE_FORMATS[:default]= '%l:%M %p'
