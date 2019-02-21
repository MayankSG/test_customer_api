# README

- Run seed command to create addresses.

-Currently any valid customer can delete any customer and can see list of customers.

-We can change it according our requirement.

## API Call

- List Address

GET /api/addresses

**response:**
[
    {
        "id": 1,
        "street": "Fay Street",
        "city": "New Dulciestad",
        "zip_code": "00642",
        "created_at": "2019-02-21T16:24:18.475Z",
        "updated_at": "2019-02-21T16:24:18.475Z"
    },
    ...
]

- Create customer
POST /api/customers
body:
{
  customer: {name: 'xyz', address_id: 1}
}

**response:**
{
    "id": 4,
    "name": "mayank",
    "auth_token": "2sNfaq4w2ZRt9zm71xZ92yRh",
    "address_id": 1,
    "created_at": "2019-02-21T18:21:39.140Z",
    "updated_at": "2019-02-21T18:21:39.140Z"
}

- List customers
GET /api/customers
headers: { auth_token: GtQpgFPWK5XXVm95CPCAJhrW }

**response:**
[
    {
        "id": 3,
        "name": "mayank",
        "auth_token": "GtQpgFPWK5XXVm95CPCAJhrW",
        "address_id": 1,
        "created_at": "2019-02-21T17:27:39.545Z",
        "updated_at": "2019-02-21T17:27:39.545Z"
    }
]

- Filters
GET /api/customers?customer_name=mayank

headers: { auth_token: GtQpgFPWK5XXVm95CPCAJhrW }

**response:**
[
    {
        "id": 3,
        "name": "mayank",
        "auth_token": "GtQpgFPWK5XXVm95CPCAJhrW",
        "address_id": 1,
        "created_at": "2019-02-21T17:27:39.545Z",
        "updated_at": "2019-02-21T17:27:39.545Z"
    }
]

GET /api/customers?street_name=mayank

headers: { auth_token: GtQpgFPWK5XXVm95CPCAJhrW }

**response:**
[
    {
        "id": 3,
        "name": "mayank",
        "auth_token": "GtQpgFPWK5XXVm95CPCAJhrW",
        "address_id": 1,
        "created_at": "2019-02-21T17:27:39.545Z",
        "updated_at": "2019-02-21T17:27:39.545Z"
    }
]


- Delete customer

DELETE /api/customers/3

headers: { auth_token: GtQpgFPWK5XXVm95CPCAJhrW }

**response:**
{
    "message": "Deletion of customer mayank is successful"
}
