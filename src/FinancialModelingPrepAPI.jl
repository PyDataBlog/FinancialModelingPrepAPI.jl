module FinancialModelingPrepAPI



using HTTP
using JSON3



include("base.jl")
include("stock_fundamentals.jl")


export FinancialModelingPrep, StockFundamentals,
    financial_statements_list, financial_statements,
    revenue_product_segmentation, revenue_geographic_segmentation,
    earning_call_transcript


end
