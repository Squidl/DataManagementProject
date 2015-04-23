all:
	cat dropall.sql tables.sql views.sql sample_people_data.sql sample_package_data.sql sample_job_data.sql sample_photo_data.sql demoscript.sql | psql -U p32002h
connect:
	psql -U p32002h
