BEGIN TRANSACTION;

DROP TABLE IF EXISTS "BrokerAccount";

CREATE TABLE IF NOT EXISTS "BrokerAccount" (
	"alias" TEXT NOT NULL,
	"broker" TEXT NOT NULL,
	"mode" TEXT NOT NULL,
	"username" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	PRIMARY KEY("alias")
);

DROP TABLE IF EXISTS "IbTrade";

CREATE TABLE IF NOT EXISTS "IbTrade" (
	"execution_id" TEXT NOT NULL,
	"symbol" TEXT,
	"supports_tax_opt" TEXT,
	"side" TEXT,
	"order_description" TEXT,
	"trade_time" TEXT,
	"trade_time_r" BIGINT,
	"size" FLOAT,
	"price" TEXT,
	"submitter" TEXT,
	"exchange" TEXT,
	"commission" TEXT,
	"net_amount" FLOAT,
	"account" TEXT,
	"accountCode" TEXT,
	"company_name" TEXT,
	"contract_description_1" TEXT,
	"sec_type" TEXT,
	"listing_exchange" TEXT,
	"conid" BIGINT,
	"conidEx" TEXT,
	"directed_exchange" TEXT,
	"clearing_id" TEXT,
	"clearing_name" TEXT,
	"liquidation_trade" TEXT,
	"is_event_trading" TEXT,
	"order_ref" TEXT,
	PRIMARY KEY("execution_id")
);

DROP TABLE IF EXISTS "RawOrder";

CREATE TABLE IF NOT EXISTS "RawOrder" (
	"id" TEXT NOT NULL,
	"plan_id" TEXT NOT NULL,
	"run_id" TEXT NOT NULL,
	"ticker" TEXT NOT NULL,
	"side" TEXT NOT NULL,
	"size" BIGINT NOT NULL,
	"signal_date" DATETIME NOT NULL,
	"entry_type" TEXT NOT NULL,
	"broker_order_id" TEXT,
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "TradePlan";

CREATE TABLE IF NOT EXISTS "TradePlan" (
	"id" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"strategy_file" TEXT NOT NULL,
	"ticker_css" TEXT NOT NULL,
	"market_timezone" TEXT NOT NULL,
	"data_source" TEXT NOT NULL,
	"backtest_start_date" TEXT NOT NULL,
	"trade_start_date" TEXT NOT NULL,
	"trade_time_of_day" TEXT NOT NULL,
	"broker_account" TEXT,
	"commission_rate" FLOAT NOT NULL,
	"initial_cash" FLOAT NOT NULL,
	"enabled" BOOLEAN NOT NULL,
	"create_time" DATETIME NOT NULL,
	"update_time" DATETIME,
	"broker_ticker_map" TEXT,
	UNIQUE("name"),
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "BacktestLog";

CREATE TABLE IF NOT EXISTS "BacktestLog" (
	"id" TEXT NOT NULL,
	"plan_id" TEXT NOT NULL,
	"plan_name" TEXT NOT NULL,
	"plan_strategy" TEXT NOT NULL,
	"plan" TEXT NOT NULL,
	"data" TEXT,
	"strategy_code" TEXT,
	"result" TEXT,
	"exception" TEXT,
	"stdout" TEXT,
	"stderr" TEXT,
	"log_time" DATETIME,
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "TraderLog";

CREATE TABLE IF NOT EXISTS "TraderLog" (
	"id" TEXT NOT NULL,
	"summary" TEXT,
	"start_time" DATETIME,
	"log_time" DATETIME,
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "OrderValidatorLog";

CREATE TABLE IF NOT EXISTS "OrderValidatorLog" (
	"id" TEXT NOT NULL,
	"order_id" TEXT NOT NULL,
	"order" TEXT NOT NULL,
	"result" TEXT NOT NULL,
	"exception" TEXT,
	"log_time" DATETIME,
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "IbOrderLog";

CREATE TABLE IF NOT EXISTS "IbOrderLog" (
	"id" TEXT NOT NULL,
	"order_id" TEXT NOT NULL,
	"account_id" TEXT NOT NULL,
	"plan" TEXT NOT NULL,
	"order" TEXT NOT NULL,
	"iborder" TEXT,
	"result" TEXT,
	"exception" TEXT,
	"broker_order_id" TEXT,
	"log_time" DATETIME,
	PRIMARY KEY("id")
);

DROP TABLE IF EXISTS "IbOrder";

CREATE TABLE IF NOT EXISTS "IbOrder" (
	"acct" TEXT,
	"conidex" TEXT,
	"conid" BIGINT,
	"orderId" BIGINT NOT NULL,
	"cashCcy" TEXT,
	"sizeAndFills" TEXT,
	"orderDesc" TEXT,
	"description1" TEXT,
	"ticker" TEXT,
	"secType" TEXT,
	"listingExchange" TEXT,
	"remainingQuantity" FLOAT,
	"filledQuantity" FLOAT,
	"avgPrice" FLOAT,
	"companyName" TEXT,
	"status" TEXT,
	"outsideRTH" BOOLEAN,
	"origOrderType" TEXT,
	"supportsTaxOpt" TEXT,
	"lastExecutionTime" TEXT,
	"orderType" TEXT,
	"bgColor" TEXT,
	"fgColor" TEXT,
	"price" TEXT,
	"order_ref" TEXT,
	"timeInForce" TEXT,
	"lastExecutionTime_r" BIGINT,
	"side" TEXT,
	"order_cancellation_by_system_reason" TEXT,
	PRIMARY KEY("orderId")
);

DROP TABLE IF EXISTS "NasdaqTraded";

CREATE TABLE IF NOT EXISTS "NasdaqTraded" (
	"nasdaq_traded" TEXT,
	"symbol" TEXT NOT NULL,
	"security_name" TEXT NOT NULL,
	-- N:NYSE, P:NYSEARCA, Z:BATS, Q:NASDAQ, A:NYSEAMERICAN 
	-- https://www.interactivebrokers.com/en/index.php?conf=am&f=1562
	"listing_exchange" TEXT,
	"market_category" INT,
	"etf" TEXT,
	"round_lot_size" TEXT,
	"test_issue" TEXT,
	"financial_status" TEXT,
	"cqs_symbol" TEXT,
	"nasdaq_symbol" TEXT,
	"nextshares" TEXT,
	PRIMARY KEY("symbol")
);

COMMIT;