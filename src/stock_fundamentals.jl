"""
"""
struct StockFundamentals <: Endpoint
    api::FinancialModelingPrep
end


"""
"""
function financial_statements_list(sf::StockFundamentals)
    url = construct_url(sf.api, "/api/v3/financial-statement-symbol-lists")
    response = make_request(url)
    return parse_response(response)
end


"""
"""
function financial_statements(sf::StockFundamentals, ticker::AbstractString, statement::AbstractString, params::AbstractDict=Dict())
    url = construct_url(sf.api, "/api/v3/financials/" * statement * "/" * ticker, params)
    response = make_request(url)
    return parse_response(response)
end


"""
"""
function revenue_product_segmentation(sf::StockFundamentals, ticker::AbstractString, period::AbstractString)
    if period == "quarter"
        params = Dict("symbol" => ticker, "period" => "quarter", "structure" => "flat")
    else
        params = Dict("symbol" => ticker, "structure" => "flat")
    end
    url = construct_url(sf.api, "/api/v4/revenue-product-segmentation", params)
    response = make_request(url)
    return parse_response(response)
end


"""
"""
function revenue_geographic_segmentation(sf::StockFundamentals, ticker::AbstractString, period::AbstractString)
    if period == "quarter"
        params = Dict("symbol" => ticker, "period" => "quarter", "structure" => "flat")
    else
        params = Dict("symbol" => ticker, "structure" => "flat")
    end
    url = construct_url(sf.api, "/api/v4/revenue-geographic-segmentation", params)
    response = make_request(url)
    return parse_response(response)
end


"""
"""
function earning_call_transcript(sf::StockFundamentals, ticker::AbstractString; year=nothing, quarter=nothing, batch=false)
    if batch
        if !isnothing(year)
            url = construct_url(sf.api, "/api/v4/batch_earning_call_transcript/" * ticker, Dict("year" => year))
        else
            throw(ArgumentError("year must be specified when batch is true"))
        end
    else
        if !isnothing(year) && !isnothing(quarter)
            params = Dict("quarter" => quarter, "year" => year)
            endpoint = "/api/v3/earning_call_transcript" * "/" * ticker
        else
            params = Dict("symbol" => ticker)
            endpoint = "/api/v4/earning_call_transcript"
        end
        url = construct_url(sf.api, endpoint, params)
    end
    return parse_response(make_request(url))
end