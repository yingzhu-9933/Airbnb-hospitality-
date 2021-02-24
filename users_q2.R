# Data Application Lab - copyright

users = read.csv('processed_users.csv')

## country
users$country = factor(ifelse(users$country_destination == 'US', 'US',
                              ifelse(users$country_destination == 'NDF', 'NDF', 'Outside US')))
summary(users$country)

## first browser
users$first_bro = factor(ifelse(users$first_browser == "Chrome", "Chrome",
                                ifelse(users$first_browser == "Safari", "Safari",
                                       ifelse(users$first_browser == "Firefox", "Firefox",
                                              ifelse(users$first_browser == "IE", "IE",
                                                     ifelse(users$first_browser == "Mobile Safari", "Mobile Safari", "other"))))))
## language
language_use <- function(language) {
  if (language == 'de') {
    return('de')
  } else if (language == 'en') {
    return('en')
  } else if (language == 'es') {
    return('es')
  } else if (language == 'fr') {
    return('fr')
  } else if (language == 'it') {
    return('it')
  } else if (language == 'ko') {
    return('ko')
  } else if (language == 'zh') {
    return('zh')
  } else return('Other')
}
users$language_use <- factor(sapply(users$language, language_use))
summary(users$language_use)

## affiliate_provider
users$affiliate_prov = factor(ifelse(users$affiliate_provider == "direct", "direct",
                                     ifelse(users$affiliate_provider == "google", "google",
                                            ifelse(users$affiliate_provider == "craigslist", "craigslist",
                                                   ifelse(users$affiliate_provider == "bing", "bing",
                                                          ifelse(users$affiliate_provider == "facebook", "facebook", "other"))))))

head(users)
write.csv(users, file = "users_q2.csv", row.names = F)
