Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'kBzeIKEv2OtFoZXrRwTrF1MX8KeT38kr',
    'pe_4Un21Syld2DmcTzlgNu9pdsxfsL7CEr8KE6W-5yM077K-GN2_jVHvfLTLzs4d',
    'bretzsam.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
