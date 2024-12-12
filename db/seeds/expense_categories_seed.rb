# db/seeds.rb

categories = [
  # Basic Necessities
  "Rent or Mortgage",
  "Property Taxes",
  "Home Repairs and Maintenance",
  "Electricity",
  "Water",
  "Gas",
  "Internet",
  "Phone",
  "Groceries",

  # Transportation
  "Public Transport",
  "Car Loan Payments",
  "Fuel",
  "Car Insurance",
  "Vehicle Maintenance",
  "Parking Fees",
  "Tolls",

  # Health and Wellness
  "Health Insurance",
  "Doctor Visits",
  "Prescription Medications",
  "Dental Care",
  "Vision Care",
  "Gym Memberships",
  "Sports Equipment",

  # Financial Obligations
  "Credit Card Payments",
  "Student Loans",
  "Personal Loans",
  "Emergency Fund Contributions",
  "Retirement Savings",
  "Investment Accounts",
  "Life Insurance",
  "Disability Insurance",

  # Discretionary Spending
  "Streaming Subscriptions",
  "Movies and Entertainment",
  "Books and Hobbies",
  "Restaurants",
  "Coffee Shops",
  "Clothing",
  "Electronics",
  "Gifts",

  # Family and Children
  "Babysitting",
  "Daycare",
  "School Supplies",
  "Pet Food",
  "Veterinary Care",

  # Miscellaneous
  "Haircuts",
  "Cosmetics",
  "Spa Services",
  "Travel Flights",
  "Travel Hotels",
  "Charity Donations",
  "Work Supplies",

  # Unexpected and Irregular Expenses
  "Medical Emergencies",
  "Home Repairs",
  "Car Repairs",
  "One-Time Purchases"
]

categories.each do |category_name|
  Category.find_or_create_by(name: category_name)
end

puts "Seeded #{categories.size} categories."
