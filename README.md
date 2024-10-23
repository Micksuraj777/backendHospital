# Hospital Management System

A Django-based application for managing hospital records, including patients, doctors, rooms, and medicines.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Installation](#installation)
- [Setup](#setup)
- [Running the Project](#running-the-project)
- [API Documentation](#api-documentation)

## Features

- Manage patient records
- Track doctor details
- Room assignment and status management
- Medicine inventory management

## Technologies

- Django
- Django REST Framework
- MySQL (or your preferred database)
- DRF-YASG for API documentation

## Installation

### Step 1: Clone the Project

```bash
git clone https://github.com/your-username/hospital-management-system.git
cd hospital-management-system
```

### Step 2: Create and Activate a Virtual Environment

On Windows:
```bash
python -m venv venv
venv\Scripts\activate
```

On macOS/Linux:
```bash
python3 -m venv venv
source venv/bin/activate
```

### Step 3: Install Required Packages

Ensure you have a `requirements.txt` file in the root of your project. Then run the following command to install the necessary packages:

```bash
pip install -r requirements.txt
```

### Step 4: Create an .env File

Create a file named `.env` in the root of your project and populate it with the following sample content. Make sure to replace the placeholder values with your actual project details:

```makefile
DEBUG=True
SECRET_KEY=your_secret_key
DATABASE_URL=mysql://user:password@localhost:3306/dbname
```

### Step 5: Apply Migrations

Run the following command to apply database migrations:

```bash
python manage.py migrate
```

### Step 6: Create a Superuser (Optional)

If you want to access the Django admin interface, create a superuser account:

```bash
python manage.py createsuperuser
```

## Running the Project

To start the development server, use the following command:

```bash
python manage.py runserver
```

Open your web browser and go to `http://127.0.0.1:8000` to access the application.

## API Documentation

You can find the API documentation at `http://127.0.0.1:8000/docs/`.
