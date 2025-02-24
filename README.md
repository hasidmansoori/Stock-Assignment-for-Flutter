# Stock Market App

A Flutter-based mobile application for stock market search and user authentication. The app allows users to log in, search for stocks, and view real-time stock data. It features a modern and visually appealing UI, smooth performance, and proper error handling.

---

## Features

- **User Authentication**: Login functionality with JWT token management.
- **Stock Search**: Search and display stock results.
- **Interactive UI**: Beautiful and intuitive UI for login and stock search.
- **Error Handling**: Proper error messages and loading states.

---

## Tech Stack

- **Flutter** (latest stable version)
- **Dart**
- **State Management**: Riverpod
- **Networking**: Dio or HTTP package
- **Local Storage**: SharedPreferences or Secure Storage
- **UI Design**: Custom modern UI

---

## Setup and Installation

Follow these steps to set up and run the app on your local machine.

### Prerequisites

Before running the app, ensure you have the following installed:

1. **Flutter**: Install from the [Flutter website](https://flutter.dev/docs/get-started/install).
2. **Android Studio** or **VS Code**: Install the IDE of your choice with the Flutter and Dart plugins.
3. **Xcode** (for iOS development, on macOS only).
4. **Dio** for API calls:
   ```bash
   flutter pub add dio
5. **Riverpod ** for state management:
   ```bash
   flutter pub add flutter_riverpod
6. **SharedPreferences ** or **Secure Storage ** Secure Storage

#### Step-by-Step Setup

1. **Clone the repository:**
	```bash
	git clone https://github.com/your-username/stock-market-app.git
2. **Navigate to the project directory:**
	```bash
	cd stock-market-app
3. **Install dependencies:**
	Install all necessary packages:
	```bash
	flutter pub get
4. **Configure API Keys and Endpoints:**
	Update API URLs and keys in the code (in the api/auth_api.dart and api/stock_api.dart files). You can configure base URLs or access tokens if required.
5. ## Run the app:

- For Android:
  ```bash
  flutter run
- For iOS:
  ```bash
  flutter run --ios
  
## API Configuration

The app uses the following API endpoints for authentication and stock search.

### 1. **Login API** (POST request)
   This API is used to authenticate users by sending their credentials and receiving a JWT token.

   **URL**:  
   `https://illuminate-production.up.railway.app/api/auth/local`

   **Request Body**:
   ```json
   {
     "identifier": "test@gmail.com",
     "password": "Test@1234"
   }
**Response:**
- On successful login, the server returns a JWT token.
- The token should be stored locally using SharedPreferences or flutter_secure_storage for subsequent API requests.

### 2. **Search Stocks API** (GET request)

This API allows the user to search for stocks by their name (symbol) and retrieve their details, such as stock name, symbol, and current price.

#### **URL**:
`https://illuminate-production.up.railway.app/api/stocks/search?query={stockName}`

#### **Request Method**:
- `GET`

#### **Request Headers**:
- `Authorization: Bearer {JWT_TOKEN}`  
  (use the token stored after login)

#### **Request Parameters**:
- `query`: The search term, typically the stock name or symbol (e.g., "Tesla" or "AAPL").

#### **Example Request**:
```http
GET https://illuminate-production.up.railway.app/api/stocks/search?query=Tesla

**Response:**
- 200 OK: On success, the server will return a JSON response containing a list of stock details that match the search query.
```json
[
  {
    "id": 8471,
    "name": "Tesla Inc",
    "symbol": "TSLA",
    "price": 698.92,
    "change": 12.42,
    "percentage_change": 1.8,
    "currency": "USD"
  },
  {
    "id": 1234,
    "name": "Tesla Motors",
    "symbol": "TSLA",
    "price": 695.24,
    "change": -3.68,
    "percentage_change": -0.52,
    "currency": "USD"
  }
]

### 3. **Get Stock by ID API** (GET request)

This API allows you to fetch detailed information about a specific stock using its unique `stockId`.

#### **URL**:
`https://illuminate-production.up.railway.app/api/stocks/{stockId}`

#### **Request Method**:
- `GET`

#### **Request Headers**:
- `Authorization: Bearer {JWT_TOKEN}`  
  (use the token stored after login)

#### **Request Parameters**:
- `stockId`: The unique identifier for the stock.

#### **Example Request**:
```http
GET https://illuminate-production.up.railway.app/api/stocks/8471

**Response:**
- 200 OK: On success, the server will return a JSON response containing detailed information about the stock.
```json
{
  "id": 8471,
  "name": "Tesla Inc",
  "symbol": "TSLA",
  "price": 698.92,
  "change": 12.42,
  "percentage_change": 1.8,
  "currency": "USD",
  "market_cap": "650B",
  "volume": "20M",
  "pe_ratio": 100.5
}

### 4. **Get Stock Price Graph API** (GET request)

This API retrieves the price graph of a specific stock for a specified time range (1 day, 1 week, 1 month, 1 year, or 5 years).

#### **URL**:
`https://illuminate-production.up.railway.app/api/stocks/{stockId}/price-graph?range={range}`

#### **Request Method**:
- `GET`

#### **Request Headers**:
- `Authorization: Bearer {JWT_TOKEN}`  
  (use the token stored after login)

#### **Request Parameters**:
- `stockId`: The unique identifier for the stock.
- `range`: The time range for the price graph. Allowed values:
  - `1D` (1 day)
  - `1W` (1 week)
  - `1M` (1 month)
  - `1Y` (1 year)
  - `5Y` (5 years)

#### **Example Request**:
```http
GET https://illuminate-production.up.railway.app/api/stocks/8471/price-graph?range=1D

**Response:**
- 200 OK: On success, the server will return a JSON response containing the price graph data for the specified stock.
```json
{
  "stock_id": 8471,
  "name": "Tesla Inc",
  "symbol": "TSLA",
  "price_graph": [
    {"timestamp": "2025-02-20T00:00:00Z", "price": 698.92},
    {"timestamp": "2025-02-20T01:00:00Z", "price": 700.10},
    {"timestamp": "2025-02-20T02:00:00Z", "price": 703.50},
    {"timestamp": "2025-02-20T03:00:00Z", "price": 705.60},
    {"timestamp": "2025-02-20T04:00:00Z", "price": 709.00}
  ],
  "currency": "USD"
}
