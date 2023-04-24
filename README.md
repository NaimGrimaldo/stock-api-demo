# README

Stock Api, based on json api serializer standard.

* Ruby version

  3.2.1

* Rails version

    '~> 7.0.4'

* Bundler version

   2.4.12


* Configuration

  First you need to setup your environment variables, you should copy the content of `env.example` to `.env.development.local`

  ```shell
  $ bundle install
  ```

* Database creation (PostgreSQL)

  ```shell
  $ rails db:create db:migrate
  ```

* How to run the test suite

    ```shell
    $ bundle exec rspec
    ```

* Start Rails server

    ```shell
    $ rails s
    ```
* On docs/stock_api.json, json request collection with all the available api endpoints with example request bodies.

* Start Rails Console

    ```shell
    $ rails c
    ```

On the console you can build or create records with dummy factories, if you want to use:

```ruby
  # all available factories spec/factories
  FactoryBot.build(:product)
  FactoryBot.create(:user)
```

## MODELS

* Address
     ```ruby
    # Table name: addresses
    #
    #  id              :uuid             not null, primary key
    #  owner_type      :string           not null
    #  owner_id        :uuid             not null
    #  street          :string           not null
    #  exterior_number :string           not null
    #  interior_number :string
    #  neighborhood    :string           not null
    #  municipality    :string
    #  city            :string           not null
    #  state           :string           not null
    #  zip_code        :string           not null
    #  country         :string           not null
    #  created_at      :datetime         not null
    #  updated_at      :datetime         not null
    #  deleted_at      :datetime
    #
    ```

* BaseMeasurementUnit
     ```ruby
    #
    # Table name: base_measurement_units
    #
    #  id          :uuid             not null, primary key
    #  name        :string           not null
    #  description :string           not null
    #  created_at  :datetime         not null
    #  updated_at  :datetime         not null
    #  deleted_at  :datetime
    #
    ```

* Brand
     ```ruby
    #
    # Table name: brands
    #
    #  id         :uuid             not null, primary key
    #  name       :string           not null
    #  deleted_at :datetime
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #
    ```

* Customer
     ```ruby
    #
    # Table name: customers
    #
    #  id                 :uuid             not null, primary key
    #  legal_name         :string
    #  nickname           :string           not null
    #  first_name         :string
    #  middle_name        :string
    #  last_name          :string
    #  maternal_last_name :string
    #  birth_date         :date
    #  email              :string
    #  phone              :string
    #  gender             :integer
    #  rfc                :string
    #  curp               :string
    #  nationality        :string
    #  customer_type      :integer          not null
    #  created_at         :datetime         not null
    #  updated_at         :datetime         not null
    #  deleted_at         :datetime
    #
    ```

* ProductPresentation
     ```ruby
    #
    # Table name: product_presentations
    #
    #  id              :uuid             not null, primary key
    #  name            :string           not null
    #  description     :string           not null
    #  factor_per_item :integer          default(1), not null
    #  nickname        :string
    #  deleted_at      :datetime
    #  created_at      :datetime         not null
    #  updated_at      :datetime         not null
    #
    ```

* Product
     ```ruby
    #
    # Table name: products
    #
    #  id                       :uuid             not null, primary key
    #  name                     :string
    #  description              :string           not null
    #  internal_id              :integer          not null
    #  purchase_price           :decimal(, )      default(0.0), not null
    #  sale_price               :decimal(, )      default(0.0), not null
    #  brand_id                 :uuid             not null
    #  stock_quantity           :integer          default(0), not null
    #  min_stock_quantity       :integer          default(0), not null
    #  max_stock_quantity       :integer          default(0), not null
    #  status                   :integer
    #  base_measurement_unit_id :uuid             not null
    #  product_presentation_id  :uuid             not null
    #  deleted_at               :datetime
    #  created_at               :datetime         not null
    #  updated_at               :datetime         not null
    #
    ```

* Provider
     ```ruby
    #
    # Table name: providers
    #
    #  id                 :uuid             not null, primary key
    #  legal_name         :string
    #  nickname           :string           not null
    #  first_name         :string
    #  middle_name        :string
    #  last_name          :string
    #  maternal_last_name :string
    #  birth_date         :date
    #  email              :string           not null
    #  phone              :string           not null
    #  website            :string
    #  rfc                :string
    #  curp               :string
    #  nationality        :string
    #  internal_id        :integer          not null
    #  starts_on          :date
    #  provider_type      :integer          not null
    #  created_at         :datetime         not null
    #  updated_at         :datetime         not null
    #  deleted_at         :datetime
    #
    ```

* Transaction
     ```ruby
    #
    # Table name: transactions
    #
    #  id               :uuid             not null, primary key
    #  owner_type       :string           not null
    #  owner_id         :uuid             not null
    #  user_id          :uuid             not null
    #  transaction_type :integer
    #  status           :integer          default("pending"), not null
    #  product_id       :uuid             not null
    #  quantity         :integer
    #  total            :decimal(, )
    #  deleted_at       :datetime
    #  created_at       :datetime         not null
    #  updated_at       :datetime         not null
    #
    ```

* User
     ```ruby
    #
    # Table name: users
    #
    #  id                 :uuid             not null, primary key
    #  first_name         :string           not null
    #  middle_name        :string
    #  last_name          :string           not null
    #  maternal_last_name :string
    #  birth_date         :date
    #  email              :string           not null
    #  phone              :string           not null
    #  gender             :integer
    #  rfc                :string
    #  curp               :string
    #  nationality        :string
    #  role               :integer
    #  internal_id        :integer
    #  starts_on          :date
    #  created_at         :datetime         not null
    #  updated_at         :datetime         not null
    #  deleted_at         :datetime
    #
    ```

# JSON RESPONSES

## Address

- Object

    ```ruby
        {
            "data": {
                "id": "caa06e56-177e-4f96-b765-1779a8ec2f10",
                "type": "address",
                "attributes": {
                    "street": "Abdul Circle",
                    "exterior_number": "2841",
                    "interior_number": "57485",
                    "neighborhood": "Renton West",
                    "municipality": "Soyaló",
                    "city": "Tampacán",
                    "state": "Guanajuato",
                    "zip_code": "00642",
                    "country": "UG"
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "address",
                "attributes": {
                    "street": null,
                    "exterior_number": "2841",
                    "interior_number": "57485",
                    "neighborhood": "Renton West",
                    "municipality": "Soyaló",
                    "city": "Tampacán",
                    "state": "Guanajuato",
                    "zip_code": "00642",
                    "country": "UG"
                }
            },
            "meta": {
                "errors": [
                    "Calle no puede estar en blanco",
                    # N
                ]
            }
        }
    ```

- Collection

    ```ruby
        {
            "data": [
                {
                    "id": "caa06e56-177e-4f96-b765-1779a8ec2f10",
                    "type": "address",
                    "attributes": {
                        "street": "Abdul Circle",
                        "exterior_number": "2841",
                        "interior_number": "57485",
                        "neighborhood": "Renton West",
                        "municipality": "Soyaló",
                        "city": "Tampacán",
                        "state": "Guanajuato",
                        "zip_code": "00642",
                        "country": "UG"
                    }
                },
                {
                    "id": "55b4d867-34a9-4bfd-b7ea-91bbf82f4bff",
                    "type": "address",
                    "attributes": {
                        "street": "jsdbsd hjsd ",
                        "exterior_number": "2841",
                        "interior_number": "57485",
                        "neighborhood": "Renton West",
                        "municipality": "Soyaló",
                        "city": "Tampacán",
                        "state": "Guanajuato",
                        "zip_code": "00642",
                        "country": "UG"
                    }
                },
                # N
            ]
        }
    ```

## BaseMeasurementUnit

 - Object

    ```ruby
        {
            "data": {
                "id": "877bcb53-c2ee-4b57-a6d4-189661a5097a",
                "type": "base_measurement_unit",
                "attributes": {
                    "name": "Abdul Circle",
                    "description": "2841 blashjsjs "
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "base_measurement_unit",
                "attributes": {
                    "name": null,
                    "description": "2841 blashjsjs "
                }
            },
            "meta": {
                "errors": [
                    "Nombre no puede estar en blanco"
                ]
            }
        }
    ```

- Collection

    ```ruby
        {
            "data": [
          		{
                    "id": "877bcb53-c2ee-4b57-a6d4-189661a5097a",
                    "type": "base_measurement_unit",
                    "attributes": {
                        "name": "Abdul Circle",
                        "description": "2841 blashjsjs "
                    }
                },
                {
                    "id": "4b003e38-4e10-4bbb-be9e-1a863b1ae81a",
                    "type": "base_measurement_unit",
                    "attributes": {
                        "name": "scjnksdnjsdnsd",
                        "description": "2841 blashjsjs "
                    }
                },
                # N
            ]
        }
    ```


## Brand

- Object

    ```ruby
        {
          "data": {
                "id": null,
                "type": "brand",
                "attributes": {
                    "name": "Abdul Circle"
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "brand",
                "attributes": {
                    "name": "Abdul Circle"
                }
            },
            "meta": {
                "errors": [
                    "Marca ya ha sido tomado",
                    # N
                ]
            }
        }
    ```

- Collection

    ```ruby
        {
            "data": [
          		{
                    "id": "c6c634c8-9fa2-4032-89d8-778c9351c955",
                    "type": "brand",
                    "attributes": {
                        "name": "Abdul Circle"
                    }
                },
                {
                    "id": "560016f6-38d6-47f7-9f7a-7e776d2e5dd2",
                    "type": "brand",
                    "attributes": {
                        "name": "swffsdfgsdg Circle"
                    }
                },
                # N
            ]
        }
    ```



## Customer

- Object

    ```ruby
       {
            "data": {
                "id": "2b3a23bc-0555-44be-919c-516cf452a408",
                "type": "customer",
                "attributes": {
                    "legal_name": null,
                    "nickname": "ruben",
                    "name": "Josefina Hanna Hamill Senger",
                    "first_name": "Josefina",
                    "middle_name": "Hanna",
                    "last_name": "Hamill",
                    "maternal_last_name": "Senger",
                    "birth_date": "2000-04-23",
                    "email": "sherron@mccullough.co.uk",
                    "phone": "26 1098 0150",
                    "gender": "male",
                    "rfc": null,
                    "curp": null,
                    "nationality": "TD",
                    "customer_type": "person"
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "customer",
                "attributes": {
                    "legal_name": "Herzog-Sawayn",
                    "nickname": "corinna",
                    "name": "Herzog-Sawayn",
                    "first_name": null,
                    "middle_name": null,
                    "last_name": null,
                    "maternal_last_name": null,
                    "birth_date": null,
                    "email": "reva.bergnaum@rutherford.ca",
                    "phone": "64 8943 4000",
                    "gender": null,
                    "rfc": null,
                    "curp": null,
                    "nationality": null,
                    "customer_type": "company"
                }
            },
            "meta": {
                "errors": [
                    "Correo electrónico ya ha sido tomado",
                    "usuario ya ha sido tomado",
                    "RFC no puede estar en blanco"
                ]
            }
        }
    ```

- Collection

  ```ruby
        {
            "data": [
                {
                    "id": "2b3a23bc-0555-44be-919c-516cf452a408",
                    "type": "customer",
                    "attributes": {
                        "legal_name": null,
                        "nickname": "ruben",
                        "name": "Josefina Hanna Hamill Senger",
                        "first_name": "Josefina",
                        "middle_name": "Hanna",
                        "last_name": "Hamill",
                        "maternal_last_name": "Senger",
                        "birth_date": "2000-04-23",
                        "email": "sherron@mccullough.co.uk",
                        "phone": "26 1098 0150",
                        "gender": "male",
                        "rfc": null,
                        "curp": null,
                        "nationality": "TD",
                        "customer_type": "person"
                    }
                },
                {
                    "id": "734a2995-3827-4149-a99b-097a21a74ddd",
                    "type": "customer",
                    "attributes": {
                        "legal_name": "Herzog-Sawayn",
                        "nickname": "corinna",
                        "name": "Herzog-Sawayn",
                        "first_name": null,
                        "middle_name": null,
                        "last_name": null,
                        "maternal_last_name": null,
                        "birth_date": null,
                        "email": "reva.bergnaum@rutherford.ca",
                        "phone": "64 8943 4000",
                        "gender": null,
                        "rfc": "XAXX010101",
                        "curp": null,
                        "nationality": null,
                        "customer_type": "company"
                    }
                }
            ]
        }
    ```

## ProductPresentation

- Object

    ```ruby
        {
          	"data": {
                "id": "79c6ca7d-618a-4e21-aa86-28ff2706d15e",
                "type": "product_presentation",
                "attributes": {
                    "name": "tonsdccd",
                    "nickname": "BTKLPRUEsdc",
                    "factor_per_item": 4,
                    "description": "Commodi vitae aut adipisci quaerat dolorem."
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "product_presentation",
                "attributes": {
                    "name": "tonsdccd",
                    "nickname": "BTKLPRUE",
                    "factor_per_item": 4,
                    "description": "Commodi vitae aut adipisci quaerat dolorem."
                }
            },
            "meta": {
                "errors": [
                    "Alias ya ha sido tomado",
                    # N
                ]
            }
        }
    ```

- Collection

    ```ruby
       {
            "data": [
                {
                    "id": "10531d39-7b20-47e5-9107-338abdb50a47",
                    "type": "product_presentation",
                    "attributes": {
                        "name": "ton",
                        "nickname": "BTKLPRUE",
                        "factor_per_item": 4,
                        "description": "Commodi vitae aut adipisci quaerat dolorem."
                    }
                },
                {
                    "id": "79c6ca7d-618a-4e21-aa86-28ff2706d15e",
                    "type": "product_presentation",
                    "attributes": {
                        "name": "tonsdccd",
                        "nickname": "BTKLPRUEsdc",
                        "factor_per_item": 4,
                        "description": "Commodi vitae aut adipisci quaerat dolorem."
                    }
                },
                # N
            ]
        }
    ```



## Product

- Object

    ```ruby
       {
            "data": {
                "id": "d9c53541-3f42-4061-9c05-b6e8645c6c3b",
                "type": "product",
                "attributes": {
                    "name": "Electric Input Lifter",
                    "description": "Cupiditate quos dignissimos vitae id assumenda.",
                    "internal_id": 1,
                    "purchase_price": "1.4",
                    "sale_price": "1.5",
                    "brand_id": "34e8c395-4ba2-46a8-a4de-e111ba53b625",
                    "stock_quantity": 55,
                    "min_stock_quantity": 0,
                    "max_stock_quantity": 99,
                    "status": "stocked",
                    "brand_name": "Fay-Haley",
                    "base_measurement_unit_name": "tenetur",
                    "product_presentation_nickname": "GCSCOK"
                }
            }
        }
    ```

- Object with error

    ```ruby
        {
            "data": {
                "id": null,
                "type": "product",
                "attributes": {
                    "name": "Output Dummy Groove",
                    "description": "Facere necessitatibus sunt animi magni.",
                    "internal_id": null,
                    "purchase_price": "3.9",
                    "sale_price": "8.7",
                    "brand_id": "0e93c93e-a095-4488-8bac-d922f95be10c",
                    "stock_quantity": 46,
                    "min_stock_quantity": 0,
                    "max_stock_quantity": 99,
                    "status": "stocked",
                    "brand_name": null,
                    "base_measurement_unit_name": null,
                    "product_presentation_nickname": null
                }
            },
            "meta": {
                "errors": [
                    "Brand debe existir",
                    "Base measurement unit debe existir",
                    "Product presentation debe existir",
                    # N
                ]
            }
        }
    ```

- Collection
   ```ruby
       {
            "data": [
               	{
                    "id": "d9c53541-3f42-4061-9c05-b6e8645c6c3b",
                    "type": "product",
                    "attributes": {
                        "name": "Electric Input Lifter",
                        "description": "Cupiditate quos dignissimos vitae id assumenda.",
                        "internal_id": 1,
                        "purchase_price": "1.4",
                        "sale_price": "1.5",
                        "brand_id": "34e8c395-4ba2-46a8-a4de-e111ba53b625",
                        "stock_quantity": 55,
                        "min_stock_quantity": 0,
                        "max_stock_quantity": 99,
                        "status": "stocked",
                        "brand_name": "Fay-Haley",
                        "base_measurement_unit_name": "tenetur",
                        "product_presentation_nickname": "GCSCOK"
                    }
                },
                {
                    "id": "0165c08f-9033-4f67-bd60-d9fdfa73a373",
                    "type": "product",
                    "attributes": {
                        "name": "Disc Bracket",
                        "description": "Minus soluta maxime amet recusandae vero pariatur perspiciatis aspernatur.",
                        "internal_id": 2,
                        "purchase_price": "3.9",
                        "sale_price": "2.4",
                        "brand_id": "cf4ee479-871b-40c4-9156-82cab6fbb355",
                        "stock_quantity": 24,
                        "min_stock_quantity": 0,
                        "max_stock_quantity": 99,
                        "status": "discontinued",
                        "brand_name": "Wehner, Prohaska and Batz",
                        "base_measurement_unit_name": "error",
                        "product_presentation_nickname": "FS"
                    }
                },
                # N
            ]
        }
    ```

## Provider

- Object

    ```ruby
       {
            "data": {
                "id": "d9c53541-3f42-4061-9c05-b6e8645c6c3b",
                "type": "product",
                "attributes": {
                    "name": "Electric Input Lifter",
                    "description": "Cupiditate quos dignissimos vitae id assumenda.",
                    "internal_id": 1,
                    "purchase_price": "1.4",
                    "sale_price": "1.5",
                    "brand_id": "34e8c395-4ba2-46a8-a4de-e111ba53b625",
                    "stock_quantity": 55,
                    "min_stock_quantity": 0,
                    "max_stock_quantity": 99,
                    "status": "stocked",
                    "brand_name": "Fay-Haley",
                    "base_measurement_unit_name": "tenetur",
                    "product_presentation_nickname": "GCSCOK"
                }
            }
        }
    ```

- Object with error

    ```ruby
    {
        "data": {
            "id": null,
            "type": "provider",
            "attributes": {
                "legal_name": null,
                "nickname": "ruben",
                "name": "Josefina Hanna Hamill Senger",
                "first_name": "Josefina",
                "middle_name": "Hanna",
                "last_name": "Hamill",
                "maternal_last_name": "Senger",
                "birth_date": "2000-04-23",
                "email": "sherron@mccullough.co.uk",
                "phone": "26 1098 0150",
                "rfc": "XAXX010101",
                "curp": null,
                "nationality": "TD",
                "website": null,
                "internal_id": null,
                "starts_on": null,
                "provider_type": null
            }
        },
        "meta": {
            "errors": [
                "Tipo no puede estar en blanco"
            ]
        }
    }
    ```

- Collection
   ```ruby
       {
            "data": [
                {
                        "id": "f4c6e31e-9adf-4d16-af4c-653baabd41e7",
                        "type": "provider",
                        "attributes": {
                            "legal_name": null,
                            "nickname": "wilfredo_montserrat_hansen_keebler",
                            "name": "Wilfredo Montserrat Hansen Keebler",
                            "first_name": "Wilfredo",
                            "middle_name": "Montserrat",
                            "last_name": "Hansen",
                            "maternal_last_name": "Keebler",
                            "birth_date": "1999-04-23",
                            "email": "rhonda_schuster@champlin.co.uk",
                            "phone": "76 2274 6106",
                            "rfc": "XAXX010101",
                            "curp": "BACJ841223HASRVN09",
                            "nationality": "PH",
                            "website": null,
                            "internal_id": 1,
                            "starts_on": null,
                            "provider_type": "person"
                        }
                    },
                    {
                        "id": "af80c57a-24ef-4d13-a166-89e2b575dc89",
                        "type": "provider",
                        "attributes": {
                            "legal_name": null,
                            "nickname": "marisol_sergio_runolfsson_rowe",
                            "name": "Marisol Sergio Runolfsson Rowe",
                            "first_name": "Marisol",
                            "middle_name": "Sergio",
                            "last_name": "Runolfsson",
                            "maternal_last_name": "Rowe",
                            "birth_date": "1992-04-23",
                            "email": "shaunte.fay@von.com",
                            "phone": "22 3536 1157",
                            "rfc": "XAXX010101",
                            "curp": "BACJ841223HASRVN09",
                            "nationality": "CH",
                            "website": null,
                            "internal_id": 2,
                            "starts_on": null,
                            "provider_type": "person"
                        }
                    },
                # N
            ]
        }
    ```


## Transaction

- Object

    ```ruby
       {
            "data": {
                "id": "86b6c8a3-bad3-43cc-a5f0-bd4e205d6d84",
                "type": "transaction",
                "attributes": {
                    "transaction_type": "purchase",
                    "owner_name": "Wilfredo Montserrat Hansen Keebler",
                    "user_name": "Rebeca Paloma Wisozk Hand",
                    "status": "approved",
                    "product_name": "Electric Input Lifter",
                    "quantity": 5,
                    "total": "7.0"
                }
            }
        }
    ```

- Object with error

    ```ruby
    {
        "data": {
            "id": null,
            "type": "transaction",
            "attributes": {
                "transaction_type": "purchase",
                "owner_name": "Wilfredo Montserrat Hansen Keebler",
                "user_name": "Rebeca Paloma Wisozk Hand",
                "status": "pending",
                "product_name": "Electric Input Lifter",
                "quantity": 45,
                "total": "63.0"
            }
        },
        "meta": {
            "errors": [
                "Cantidad El producto supera el stock máximo permitido."
            ]
        }
    }
    ```

- Collection
   ```ruby
    {
        "data": [
            {
                "id": "86b6c8a3-bad3-43cc-a5f0-bd4e205d6d84",
                "type": "transaction",
                "attributes": {
                    "transaction_type": "purchase",
                    "owner_name": "Wilfredo Montserrat Hansen Keebler",
                    "user_name": "Rebeca Paloma Wisozk Hand",
                    "status": "approved",
                    "product_name": "Electric Input Lifter",
                    "quantity": 5,
                    "total": "7.0"
                }
            },
            {
                "id": "ae6bc6e0-7728-44fe-885d-537a79bb23f8",
                "type": "transaction",
                "attributes": {
                    "transaction_type": "purchase",
                    "owner_name": "Wilfredo Montserrat Hansen Keebler",
                    "user_name": "Rebeca Paloma Wisozk Hand",
                    "status": "approved",
                    "product_name": "Electric Input Lifter",
                    "quantity": 5,
                    "total": "7.0"
                }
            }
        ]
    }
    ```


## User

- Object

    ```ruby
    {
        "data": {
            "id": "31d0e038-c4d0-4203-87a4-5c6ad9387bae",
            "type": "user",
            "attributes": {
                "name": "Yordivxc Verónica Frami Bogisich",
                "first_name": "Yordivxc",
                "middle_name": "Verónica",
                "last_name": "Frami",
                "maternal_last_name": "Bogisich",
                "birth_date": "1974-04-23",
                "email": "star_gleichnerxccx@ernser.info",
                "phone": "32 0405 3419",
                "gender": "male",
                "rfc": "XAXX010101",
                "curp": "BACJ841223HASRVN09",
                "nationality": "NE",
                "role": "admin",
                "internal_id": null,
                "starts_on": "2022-05-23"
            }
        }
    }
    ```

- Object with error

    ```ruby
    {
        "data": {
            "id": null,
            "type": "user",
            "attributes": {
                "name": "Yordivxc Verónica Frami Bogisich",
                "first_name": "Yordivxc",
                "middle_name": "Verónica",
                "last_name": "Frami",
                "maternal_last_name": "Bogisich",
                "birth_date": "1974-04-23",
                "email": "star_gleichnerx@ernser.info",
                "phone": "32 0405 3419",
                "gender": "male",
                "rfc": "XAXX010101",
                "curp": "BACJ841223HASRVN09",
                "nationality": "NE",
                "role": "admin",
                "internal_id": null,
                "starts_on": "2022-05-23"
            }
        },
        "meta": {
            "errors": [
                "Correo electrónico ya ha sido tomado"
            ]
        }
    }
    ```

- Collection

    ```ruby
  {
        "data": [
            {
                "id": "a188358a-22b4-42bb-8e12-034f206b9bcd",
                "type": "user",
                "attributes": {
                    "name": "Rebeca Paloma Wisozk Hand",
                    "first_name": "Rebeca",
                    "middle_name": "Paloma",
                    "last_name": "Wisozk",
                    "maternal_last_name": "Hand",
                    "birth_date": "1977-04-23",
                    "email": "mauro.schowalter@corkery.ca",
                    "phone": "38 7160 6467",
                    "gender": "female",
                    "rfc": "XAXX010101",
                    "curp": "BACJ841223HASRVN09",
                    "nationality": "CF",
                    "role": "salesman",
                    "internal_id": 1,
                    "starts_on": "2022-05-23"
                }
            },
            {
                "id": "31d0e038-c4d0-4203-87a4-5c6ad9387bae",
                "type": "user",
                "attributes": {
                    "name": "Yordivxc Verónica Frami Bogisich",
                    "first_name": "Yordivxc",
                    "middle_name": "Verónica",
                    "last_name": "Frami",
                    "maternal_last_name": "Bogisich",
                    "birth_date": "1974-04-23",
                    "email": "star_gleichnerxccx@ernser.info",
                    "phone": "32 0405 3419",
                    "gender": "male",
                    "rfc": "XAXX010101",
                    "curp": "BACJ841223HASRVN09",
                    "nationality": "NE",
                    "role": "admin",
                    "internal_id": 2,
                    "starts_on": "2022-05-23"
                }
            },
            # N
        ]
    }
    ```
