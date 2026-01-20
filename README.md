# Ruby on Rails Restaurant Management

A restaurant management system built with Ruby on Rails.

## Features

- Restaurant management
- Menu and menu items
- Order processing
- Reservation system
- JWT authentication

## Installation

```bash
bundle install
rails db:create db:migrate
rails server
```

## API Endpoints

- POST /api/v1/auth/register - Register user
- POST /api/v1/auth/login - Login
- GET /api/v1/restaurants - List restaurants
- POST /api/v1/restaurants - Create restaurant
- GET /api/v1/orders - List orders
- POST /api/v1/reservations - Create reservation
