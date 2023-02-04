## Build the image 
Build with `docker build`:
```
cd mssql-docker/linux/preview/examples/mssql-customize
docker build -t mssql-custom .
```

## Run the container

Then spin up a new container using `docker run`
```
docker run --platform linux/amd64 -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<your-password>" -p 1433:1433 -d mssql-custom
```

Note: MSSQL passwords must be at least 8 characters long, contain upper case, lower case and digits.  
