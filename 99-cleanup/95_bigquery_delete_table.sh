. ../01-setup/00_set_params.sh

echo "REMOVING BIGQUERY TABLE '$table' ..."

bq rm $table
