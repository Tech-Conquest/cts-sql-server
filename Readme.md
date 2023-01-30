## Build the image 
Build with `docker build`:
```
cd mssql-docker/linux/preview/examples/mssql-customize
docker build -t mssql-custom .
```

## Run the container

Then spin up a new container using `docker run`
```
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=StrongPassw0rd' -p 1433:1433 --name sql1 -d mssql-custom
```

Note: MSSQL passwords must be at least 8 characters long, contain upper case, lower case and digits.  