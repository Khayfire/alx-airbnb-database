
Table users {
  id integer [primary key]
  first_name varchar 
  last_name varchar
  email varchar unique
  password_hash varchar
  phone_number varchar
  role enum
  created_at timestamp
}

Table property {
  id integer [primary key]
  host_id User(user_id)
  name varchar
  description TEXT
  location VARCHAR
  pricepernight DECIMAL
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table Booking {
  id integer [Primary Key] 
  property_id  Property(property_id)
  user_id User(user_id)
  start_date DATE
  end_date DATE 
  total_price DECIMAL 
  status ENUM (pending, confirmed, canceled)
  created_at TIMESTAMP
}

Table payment {
 id integer [Primary Key] 
 booking_id Booking(booking_id) 
 amount DECIMAL
 payment_date TIMESTAMP
 payment_method ENUM (credit_card, paypal, stripe)
}

Table Review {
   id integer [Primary Key] 
   property_id  Property(property_id)
   user_id  User(user_id)
   rating integer
   comment TEXT
   created_at TIMESTAMP
}

Table Message {
  id integer [Primary Key] 
  sender_id User(user_id)
  recipient_id User(user_id)
  message_body TEXT
  sent_at TIMESTAMP
}

-- INDEXES
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_payment_booking ON Payment(booking_id);
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);
