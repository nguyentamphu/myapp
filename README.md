# README

# Build Rails app by `docker-compose`

### Up up up, inside project, run
```bash
docker-compose up --build -d
```

### Initialize `Database`
```bash
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```

### Access service
```bash
localhost:4000
```

### `tail -f log`
```bash
docker-compose logs -f web
```

# To be continued....
