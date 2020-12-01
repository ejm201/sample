RECEIPT_ATTRIBUTES = [
   :provider,
   :provider_tranx_id,
   :transaction_type,
   :completed_at,
   #:reporting_date,
   :shiptoname,
   :shiptostreet,
   :shiptocity,
   :shiptostate,
   :shiptozip,
   :shiptocountrycode,
   :from_street,
   :from_city,
   :from_state,
   :from_zip,
   :from_country,
   # :items_sold,
   # :item_subtotal,
   :shipping_amount,
   :handling_amount,
   :discount_amount,
   :amount,
   :sales_tax_amount,
   :exemption_type,
   # :expected_tax
 ].freeze

 CSV_HEADERS = [
    "provider",
    "order_id",
    "transaction_type",
    "completed_at",
    "customer_name",
    "shiptostreet",
    "shiptocity",
    "shiptostate",
    "shiptozip",
    "shiptocountrycode",
    "from_street",
    "from_city",
    "from_state",
    "from_zip",
    "from_country",
    "shipping_amount",
    "handling_amount",
    "discount_amount",
    "total_sale",
    "sales_tax",
    "exemption_type"
  ].freeze



def order_export(uid)
  user = User.find(xyz)
  receipts = user.receipts.where(reporting_date:"2020-07-01".."2020-09-30")

  rows = receipts.map { |r| build_csv_row(r) }
  puts "## EXPORT FOR #{user.email} (#{uid}) ##\n"
  puts CSV_HEADERS.join(",")
  puts rows.compact.join("\n")
end


def build_csv_row(receipt)
  # receipt level attributes
  columns = RECEIPT_ATTRIBUTES.map {|value| receipt.send(value) }

  columns.join(",")
end
