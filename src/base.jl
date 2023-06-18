"""
"""
abstract type Endpoint end


"""
"""
struct FinancialModelingPrep
    api_key::AbstractString
    base_url::AbstractString
end



FinancialModelingPrep(api_key::AbstractString) =
    FinancialModelingPrep(api_key, "https://financialmodelingprep.com")


"""
"""
function construct_url(api::FinancialModelingPrep, endpoint::AbstractString, params::AbstractDict=Dict())

    url = api.base_url * endpoint
    if !isempty(params)
        url *= "?"
        for (key, value) in params
            url *= "$key=$value&"
        end
    end
    url *= "apikey=" * api.api_key
    return url
end


"""
"""
function construct_url(api::FinancialModelingPrep, endpoint::AbstractString)
    url = api.base_url * endpoint
    url *= "?apikey=" * api.api_key
    return url
end


"""
"""
function make_request(url::AbstractString)
    response = HTTP.get(url)
    if response.status != 200
        error("HTTP request failed with status $(response.status)")
    end
    return response
end


"""
"""
function parse_response(response)
    return JSON3.read(response.body)
end


"""
"""
function get_data(api::FinancialModelingPrep, params::AbstractDict=Dict())
    url = construct_url(api, params)
    response = make_request(url)
    return parse_response(response)
end