#!/bin/sh
read -p "Enter Netcdf Filename : " fname
read -p "Enter variable name : " var
read -p "Enter number of bands to extract : " bands
read -p "Output Prefix : " outp

cdo -selvar,$var $fname $fname"_"$var".nc"
gdal_translate -of netCDF  $fname"_"$var".nc" $outp"_all.tiff"

for i in $(seq 1 $bands);
do
	gdal_translate -b $i $outp"_all.tiff"  $outp_"b"$i".tiff";
done
