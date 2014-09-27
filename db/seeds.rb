puts '=' * 50

if Rails.env.test?

  puts 'ERROR - you are in Rails TEST mode. '
  puts 'Seeds are not intended for this environment - use FactoryGirls instead.'

else

  #==================================================
  print 'Currencies: '
  currencies = [
          {id: 1, name: 'Euro', iso_code: 'EUR', leading_symbol: '€', trailing_symbol: 'c',
           thousands_separator: ',', decimal_separator: '.', active: true, sorting_order: 10},
          {id: 2, name: 'US Dollar', iso_code: 'USD', leading_symbol: '$', trailing_symbol: 'c',
           thousands_separator: ',', decimal_separator: '.', active: true, sorting_order: 20},
          {id: 3, name: 'Canadian Dollar', iso_code: 'CAD', leading_symbol: 'C$', trailing_symbol: 'c',
           thousands_separator: ',', decimal_separator: '.', active: true, sorting_order: 30},
          {id: 4, name: 'Pounds Sterling', iso_code: 'GBP', leading_symbol: '£', trailing_symbol: 'p',
           thousands_separator: ',', decimal_separator: '.', active: true, sorting_order: 40}
  ]

  currencies.each do |c|
    Currency.where(id: c[:id]).first_or_create(c)
    print '.'
  end
  puts ' Done'

  #==================================================
  print 'Countries: '

  countries = [
          {id: 1, name: 'Andorra', sorting_order: 1000, in_the_eu: false },
          {id: 2, name: 'United Arab Emirates', sorting_order: 24350, in_the_eu: false },
          {id: 3, name: 'Afghanistan', sorting_order: 1200, in_the_eu: false },
          {id: 4, name: 'Antigua and Barbuda', sorting_order: 1300, in_the_eu: false },
          {id: 5, name: 'Anguilla', sorting_order: 1400, in_the_eu: false },
          {id: 6, name: 'Albania', sorting_order: 1500, in_the_eu: false },
          {id: 7, name: 'Armenia', sorting_order: 1600, in_the_eu: false },
          {id: 8, name: 'Angola', sorting_order: 1700, in_the_eu: false },
          {id: 9, name: 'Antarctica', sorting_order: 1800, in_the_eu: false },
          {id: 10, name: 'Argentina', sorting_order: 1900, in_the_eu: false },
          {id: 11, name: 'Samoa', sorting_order: 2000, in_the_eu: false },
          {id: 12, name: 'Western Samoa', sorting_order: 2100, in_the_eu: false },
          {id: 13, name: 'Austria', sorting_order: 2200, in_the_eu: true },
          {id: 14, name: 'Australia', sorting_order: 2300, in_the_eu: false },
          {id: 15, name: 'Aruba', sorting_order: 2400, in_the_eu: false },
          {id: 16, name: 'Aland Islands', sorting_order: 2500, in_the_eu: false },
          {id: 17, name: 'Azerbaijan', sorting_order: 2600, in_the_eu: false },
          {id: 18, name: 'Bosnia and Herzegovina', sorting_order: 2700, in_the_eu: false },
          {id: 19, name: 'Barbados', sorting_order: 2800, in_the_eu: false },
          {id: 20, name: 'Bangladesh', sorting_order: 2900, in_the_eu: false },
          {id: 21, name: 'Belgium', sorting_order: 3000, in_the_eu: true },
          {id: 22, name: 'Burkina Faso', sorting_order: 3100, in_the_eu: false },
          {id: 23, name: 'Bulgaria', sorting_order: 3200, in_the_eu: true },
          {id: 24, name: 'Bahrain', sorting_order: 3300, in_the_eu: false },
          {id: 25, name: 'Burundi', sorting_order: 3400, in_the_eu: false },
          {id: 26, name: 'Benin', sorting_order: 3500, in_the_eu: false },
          {id: 27, name: 'Saint Barthelemy', sorting_order: 3600, in_the_eu: false },
          {id: 28, name: 'Bermuda', sorting_order: 3700, in_the_eu: false },
          {id: 29, name: 'Brunei', sorting_order: 3800, in_the_eu: false },
          {id: 30, name: 'Bolivia', sorting_order: 3900, in_the_eu: false },
          {id: 31, name: 'Bonaire, Sint Eustatius and Saba', sorting_order: 4000, in_the_eu: false },
          {id: 32, name: 'Brazil', sorting_order: 4100, in_the_eu: false },
          {id: 33, name: 'Bahamas', sorting_order: 4200, in_the_eu: false },
          {id: 34, name: 'Bhutan', sorting_order: 4300, in_the_eu: false },
          {id: 35, name: 'Bouvet Island', sorting_order: 4400, in_the_eu: false },
          {id: 36, name: 'Botswana', sorting_order: 4500, in_the_eu: false },
          {id: 37, name: 'Belarus', sorting_order: 4600, in_the_eu: false },
          {id: 38, name: 'Belize', sorting_order: 4700, in_the_eu: false },
          {id: 39, name: 'Canada', sorting_order: 4800, in_the_eu: false },
          {id: 40, name: 'Cocos (Keeling) Islands', sorting_order: 4900, in_the_eu: false },
          {id: 41, name: 'Democratic Republic of Congo', sorting_order: 5000, in_the_eu: false },
          {id: 42, name: 'Central African Republic', sorting_order: 5100, in_the_eu: false },
          {id: 43, name: 'Republic of Congo', sorting_order: 5200, in_the_eu: false },
          {id: 44, name: 'Switzerland', sorting_order: 5300, in_the_eu: false },
          {id: 45, name: "Cote d'Ivoire", sorting_order: 5400, in_the_eu: false },
          {id: 46, name: 'Cook Islands', sorting_order: 5500, in_the_eu: false },
          {id: 47, name: 'Chile', sorting_order: 5600, in_the_eu: false },
          {id: 48, name: 'Cameroon', sorting_order: 5700, in_the_eu: false },
          {id: 49, name: 'Republic of China', sorting_order: 5800, in_the_eu: false },
          {id: 50, name: 'Colombia', sorting_order: 5900, in_the_eu: false },
          {id: 51, name: 'Costa Rica', sorting_order: 6000, in_the_eu: false },
          {id: 52, name: 'Cuba', sorting_order: 6100, in_the_eu: false },
          {id: 53, name: 'Cape Verde', sorting_order: 6200, in_the_eu: false },
          {id: 54, name: 'Curacao', sorting_order: 6300, in_the_eu: false },
          {id: 55, name: 'Christmas Island', sorting_order: 6400, in_the_eu: false },
          {id: 56, name: 'Cyprus', sorting_order: 6500, in_the_eu: true },
          {id: 57, name: 'Czech Republic', sorting_order: 6600, in_the_eu: true },
          {id: 58, name: 'Germany', sorting_order: 6700, in_the_eu: true },
          {id: 59, name: 'Djibouti', sorting_order: 6800, in_the_eu: false },
          {id: 60, name: 'Denmark', sorting_order: 6900, in_the_eu: true },
          {id: 61, name: 'Dominica', sorting_order: 7000, in_the_eu: false },
          {id: 62, name: 'Dominican Republic', sorting_order: 7100, in_the_eu: false },
          {id: 63, name: 'Algeria', sorting_order: 7200, in_the_eu: false },
          {id: 64, name: 'Ecuador', sorting_order: 7300, in_the_eu: false },
          {id: 65, name: 'Estonia', sorting_order: 7400, in_the_eu: true },
          {id: 66, name: 'Egypt', sorting_order: 7500, in_the_eu: false },
          {id: 67, name: 'Western Sahara', sorting_order: 7600, in_the_eu: false },
          {id: 68, name: 'Eritrea', sorting_order: 7700, in_the_eu: false },
          {id: 69, name: 'Spain', sorting_order: 7800, in_the_eu: true },
          {id: 70, name: 'Ethiopia', sorting_order: 7900, in_the_eu: false },
          {id: 71, name: 'Finland', sorting_order: 8000, in_the_eu: true },
          {id: 72, name: 'Fiji', sorting_order: 8100, in_the_eu: false },
          {id: 73, name: 'Falkland Islands', sorting_order: 8200, in_the_eu: false },
          {id: 74, name: 'Micronesia', sorting_order: 8300, in_the_eu: false },
          {id: 75, name: 'Faroe Islands', sorting_order: 8400, in_the_eu: false },
          {id: 76, name: 'France', sorting_order: 8500, in_the_eu: true },
          {id: 77, name: 'Gabon', sorting_order: 8600, in_the_eu: false },
          {id: 78, name: 'United Kingdom', sorting_order: 200, in_the_eu: true },
          {id: 79, name: 'Grenada', sorting_order: 8800, in_the_eu: false },
          {id: 80, name: 'Georgia', sorting_order: 8900, in_the_eu: false },
          {id: 81, name: 'French Guiana', sorting_order: 9000, in_the_eu: false },
          {id: 82, name: 'Guernsey', sorting_order: 9100, in_the_eu: false },
          {id: 83, name: 'Alderney', sorting_order: 9200, in_the_eu: false },
          {id: 84, name: 'Sark', sorting_order: 9300, in_the_eu: false },
          {id: 85, name: 'Ghana', sorting_order: 9400, in_the_eu: false },
          {id: 86, name: 'Gibraltar', sorting_order: 9500, in_the_eu: false },
          {id: 87, name: 'Greenland', sorting_order: 9600, in_the_eu: false },
          {id: 88, name: 'Gambia', sorting_order: 9700, in_the_eu: false },
          {id: 89, name: 'Guinea', sorting_order: 9800, in_the_eu: false },
          {id: 90, name: 'Guadeloupe', sorting_order: 9900, in_the_eu: false },
          {id: 91, name: 'Equatorial Guinea', sorting_order: 10000, in_the_eu: false },
          {id: 92, name: 'Greece', sorting_order: 10100, in_the_eu: true },
          {id: 93, name: 'South Georgia and the South Sandwich Islands', sorting_order: 10200, in_the_eu: false },
          {id: 94, name: 'Guatemala', sorting_order: 10300, in_the_eu: false },
          {id: 95, name: 'Guam', sorting_order: 10400, in_the_eu: false },
          {id: 96, name: 'Guinea-Bissau', sorting_order: 10500, in_the_eu: false },
          {id: 97, name: 'Guyana', sorting_order: 10600, in_the_eu: false },
          {id: 98, name: 'Hong Kong', sorting_order: 10700, in_the_eu: false },
          {id: 99, name: 'Heard Island and McDonald Islands', sorting_order: 10800, in_the_eu: false },
          {id: 100, name: 'Honduras', sorting_order: 10900, in_the_eu: false },
          {id: 101, name: 'Croatia', sorting_order: 11000, in_the_eu: true },
          {id: 102, name: 'Haiti', sorting_order: 11100, in_the_eu: false },
          {id: 103, name: 'Hungary', sorting_order: 11200, in_the_eu: true },
          {id: 104, name: 'Indonesia', sorting_order: 11300, in_the_eu: false },
          {id: 105, name: 'Ireland', sorting_order: 100, in_the_eu: true },
          {id: 106, name: 'Israel', sorting_order: 11500, in_the_eu: false },
          {id: 107, name: 'Isle of Man', sorting_order: 11600, in_the_eu: false },
          {id: 108, name: 'India', sorting_order: 11700, in_the_eu: false },
          {id: 109, name: 'British Indian Ocean Territory', sorting_order: 11800, in_the_eu: false },
          {id: 110, name: 'Iraq', sorting_order: 11900, in_the_eu: false },
          {id: 111, name: 'Iran', sorting_order: 12000, in_the_eu: false },
          {id: 112, name: 'Iceland', sorting_order: 12100, in_the_eu: false },
          {id: 113, name: 'Italy', sorting_order: 12200, in_the_eu: true },
          {id: 114, name: 'Jersey', sorting_order: 12300, in_the_eu: false },
          {id: 115, name: 'Jamaica', sorting_order: 12400, in_the_eu: false },
          {id: 116, name: 'Jordan', sorting_order: 12500, in_the_eu: false },
          {id: 117, name: 'Japan', sorting_order: 12600, in_the_eu: false },
          {id: 118, name: 'Kenya', sorting_order: 12700, in_the_eu: false },
          {id: 119, name: 'Kyrgyzstan', sorting_order: 12800, in_the_eu: false },
          {id: 120, name: 'Cambodia', sorting_order: 12900, in_the_eu: false },
          {id: 121, name: 'Kiribati', sorting_order: 13000, in_the_eu: false },
          {id: 122, name: 'Comoros', sorting_order: 13100, in_the_eu: false },
          {id: 123, name: 'Saint Kitts and Nevis', sorting_order: 13200, in_the_eu: false },
          {id: 124, name: 'North Korea', sorting_order: 13300, in_the_eu: false },
          {id: 125, name: 'South Korea', sorting_order: 13400, in_the_eu: false },
          {id: 126, name: 'Kuwait', sorting_order: 13500, in_the_eu: false },
          {id: 127, name: 'Cayman Islands', sorting_order: 13600, in_the_eu: false },
          {id: 128, name: 'Kazakhstan', sorting_order: 13700, in_the_eu: false },
          {id: 129, name: 'Laos', sorting_order: 13800, in_the_eu: false },
          {id: 130, name: 'Lebanon', sorting_order: 13900, in_the_eu: false },
          {id: 131, name: 'Saint Lucia', sorting_order: 14000, in_the_eu: false },
          {id: 132, name: 'Liechtenstein', sorting_order: 14100, in_the_eu: false },
          {id: 133, name: 'Sri Lanka', sorting_order: 14200, in_the_eu: false },
          {id: 134, name: 'Liberia', sorting_order: 14300, in_the_eu: false },
          {id: 135, name: 'Lesotho', sorting_order: 14400, in_the_eu: false },
          {id: 136, name: 'Lithuania', sorting_order: 14500, in_the_eu: true },
          {id: 137, name: 'Luxembourg', sorting_order: 14600, in_the_eu: true },
          {id: 138, name: 'Latvia', sorting_order: 14700, in_the_eu: true },
          {id: 139, name: 'Libya', sorting_order: 14800, in_the_eu: false },
          {id: 140, name: 'Morocco', sorting_order: 14900, in_the_eu: false },
          {id: 141, name: 'Monaco', sorting_order: 15000, in_the_eu: false },
          {id: 142, name: 'Moldova', sorting_order: 15100, in_the_eu: false },
          {id: 143, name: 'Montenegro', sorting_order: 15200, in_the_eu: false },
          {id: 144, name: 'Saint Martin (French part)', sorting_order: 15300, in_the_eu: false },
          {id: 145, name: 'Madagascar', sorting_order: 15400, in_the_eu: false },
          {id: 146, name: 'Marshall Islands', sorting_order: 15500, in_the_eu: false },
          {id: 147, name: 'FYROM', sorting_order: 15600, in_the_eu: false },
          {id: 148, name: 'Mali', sorting_order: 15700, in_the_eu: false },
          {id: 149, name: 'Myanmar', sorting_order: 15800, in_the_eu: false },
          {id: 150, name: 'Mongolia', sorting_order: 15900, in_the_eu: false },
          {id: 151, name: 'Macao', sorting_order: 16000, in_the_eu: false },
          {id: 152, name: 'Northern Mariana Islands', sorting_order: 16100, in_the_eu: false },
          {id: 153, name: 'Martinique', sorting_order: 16200, in_the_eu: false },
          {id: 154, name: 'Mauritania', sorting_order: 16300, in_the_eu: false },
          {id: 155, name: 'Montserrat', sorting_order: 16400, in_the_eu: false },
          {id: 156, name: 'Malta', sorting_order: 16500, in_the_eu: true },
          {id: 157, name: 'Mauritius', sorting_order: 16600, in_the_eu: false },
          {id: 158, name: 'Maldives', sorting_order: 16700, in_the_eu: false },
          {id: 159, name: 'Malawi', sorting_order: 16800, in_the_eu: false },
          {id: 160, name: 'Mexico', sorting_order: 16900, in_the_eu: false },
          {id: 161, name: 'Malaysia', sorting_order: 17000, in_the_eu: false },
          {id: 162, name: 'Mozambique', sorting_order: 17100, in_the_eu: false },
          {id: 163, name: 'Namibia', sorting_order: 17200, in_the_eu: false },
          {id: 164, name: 'New Caledonia', sorting_order: 17300, in_the_eu: false },
          {id: 165, name: 'Niger', sorting_order: 17400, in_the_eu: false },
          {id: 166, name: 'Norfolk Island', sorting_order: 17500, in_the_eu: false },
          {id: 167, name: 'Nigeria', sorting_order: 17600, in_the_eu: false },
          {id: 168, name: 'Nicaragua', sorting_order: 17700, in_the_eu: false },
          {id: 169, name: 'Netherlands', sorting_order: 17800, in_the_eu: true },
          {id: 170, name: 'Norway', sorting_order: 17900, in_the_eu: false },
          {id: 171, name: 'Nepal', sorting_order: 18000, in_the_eu: false },
          {id: 172, name: 'Nauru', sorting_order: 18100, in_the_eu: false },
          {id: 173, name: 'Niue', sorting_order: 18200, in_the_eu: false },
          {id: 174, name: 'New Zealand', sorting_order: 18300, in_the_eu: false },
          {id: 175, name: 'Oman', sorting_order: 18400, in_the_eu: false },
          {id: 176, name: 'Panama', sorting_order: 18500, in_the_eu: false },
          {id: 177, name: 'Peru', sorting_order: 18600, in_the_eu: false },
          {id: 178, name: 'French Polynesia', sorting_order: 18700, in_the_eu: false },
          {id: 179, name: 'Papua New Guinea', sorting_order: 18800, in_the_eu: false },
          {id: 180, name: 'Philippines', sorting_order: 18900, in_the_eu: false },
          {id: 181, name: 'Pakistan', sorting_order: 19000, in_the_eu: false },
          {id: 182, name: 'Poland', sorting_order: 19100, in_the_eu: true },
          {id: 183, name: 'Saint Pierre and Miquelon', sorting_order: 19200, in_the_eu: false },
          {id: 184, name: 'Pitcairn', sorting_order: 19300, in_the_eu: false },
          {id: 185, name: 'Puerto Rico', sorting_order: 19400, in_the_eu: false },
          {id: 186, name: 'Palestine, State of', sorting_order: 19500, in_the_eu: false },
          {id: 187, name: 'Portugal', sorting_order: 19600, in_the_eu: true },
          {id: 188, name: 'Palau', sorting_order: 19700, in_the_eu: false },
          {id: 189, name: 'Paraguay', sorting_order: 19800, in_the_eu: false },
          {id: 190, name: 'Qatar', sorting_order: 19900, in_the_eu: false },
          {id: 191, name: 'Reunion', sorting_order: 20000, in_the_eu: false },
          {id: 192, name: 'Romania', sorting_order: 20100, in_the_eu: true },
          {id: 193, name: 'Serbia', sorting_order: 20200, in_the_eu: false },
          {id: 194, name: 'Russia', sorting_order: 20300, in_the_eu: false },
          {id: 195, name: 'Rwanda', sorting_order: 20400, in_the_eu: false },
          {id: 196, name: 'Saudi Arabia', sorting_order: 20500, in_the_eu: false },
          {id: 197, name: 'Solomon Islands', sorting_order: 20600, in_the_eu: false },
          {id: 198, name: 'Seychelles', sorting_order: 20700, in_the_eu: false },
          {id: 199, name: 'Sudan', sorting_order: 20800, in_the_eu: false },
          {id: 200, name: 'Sweden', sorting_order: 20900, in_the_eu: true },
          {id: 201, name: 'Singapore', sorting_order: 21000, in_the_eu: false },
          {id: 202, name: 'Saint Helena, Ascension and Tristan da Cunha', sorting_order: 21100, in_the_eu: false },
          {id: 203, name: 'Slovenia', sorting_order: 21200, in_the_eu: true },
          {id: 204, name: 'Svalbard and Jan Mayen', sorting_order: 21300, in_the_eu: false },
          {id: 205, name: 'Slovakia', sorting_order: 21400, in_the_eu: true },
          {id: 206, name: 'Sierra Leone', sorting_order: 21500, in_the_eu: false },
          {id: 207, name: 'San Marino', sorting_order: 21600, in_the_eu: false },
          {id: 208, name: 'Senegal', sorting_order: 21700, in_the_eu: false },
          {id: 209, name: 'Somalia', sorting_order: 21800, in_the_eu: false },
          {id: 210, name: 'Suriname', sorting_order: 21900, in_the_eu: false },
          {id: 211, name: 'South Sudan', sorting_order: 22000, in_the_eu: false },
          {id: 212, name: 'Sao Tome and Principe', sorting_order: 22100, in_the_eu: false },
          {id: 213, name: 'El Salvador', sorting_order: 22200, in_the_eu: false },
          {id: 214, name: 'Sint Maarten (Dutch part)', sorting_order: 22300, in_the_eu: false },
          {id: 215, name: 'Syria', sorting_order: 22400, in_the_eu: false },
          {id: 216, name: 'Swaziland', sorting_order: 22500, in_the_eu: false },
          {id: 217, name: 'Turks and Caicos Islands', sorting_order: 22600, in_the_eu: false },
          {id: 218, name: 'Chad', sorting_order: 22700, in_the_eu: false },
          {id: 219, name: 'French Southern Territories', sorting_order: 22800, in_the_eu: false },
          {id: 220, name: 'Togo', sorting_order: 22900, in_the_eu: false },
          {id: 221, name: 'Thailand', sorting_order: 23000, in_the_eu: false },
          {id: 222, name: 'Tajikistan', sorting_order: 23100, in_the_eu: false },
          {id: 223, name: 'Tokelau', sorting_order: 23200, in_the_eu: false },
          {id: 224, name: 'East Timor', sorting_order: 23300, in_the_eu: false },
          {id: 225, name: 'Turkmenistan', sorting_order: 23400, in_the_eu: false },
          {id: 226, name: 'Tunisia', sorting_order: 23500, in_the_eu: false },
          {id: 227, name: 'Tonga', sorting_order: 23600, in_the_eu: false },
          {id: 228, name: 'Turkey', sorting_order: 23700, in_the_eu: false },
          {id: 229, name: 'Trinidad and Tobago', sorting_order: 23800, in_the_eu: false },
          {id: 230, name: 'Tuvalu', sorting_order: 23900, in_the_eu: false },
          {id: 231, name: 'Taiwan, Province of China', sorting_order: 24000, in_the_eu: false },
          {id: 232, name: 'Tanzania', sorting_order: 24100, in_the_eu: false },
          {id: 233, name: 'Ukraine', sorting_order: 24200, in_the_eu: false },
          {id: 234, name: 'Uganda', sorting_order: 24300, in_the_eu: false },
          {id: 235, name: 'United States Minor Outlying Islands', sorting_order: 24400, in_the_eu: false },
          {id: 236, name: 'United States', sorting_order: 24500, in_the_eu: false },
          {id: 237, name: 'Uruguay', sorting_order: 24600, in_the_eu: false },
          {id: 238, name: 'Uzbekistan', sorting_order: 24700, in_the_eu: false },
          {id: 239, name: 'Vatican City', sorting_order: 24800, in_the_eu: false },
          {id: 240, name: 'Saint Vincent and Grenadines', sorting_order: 24900, in_the_eu: false },
          {id: 241, name: 'Venezuela', sorting_order: 25000, in_the_eu: false },
          {id: 242, name: 'Virgin Islands, British', sorting_order: 25100, in_the_eu: false },
          {id: 243, name: 'Virgin Islands, U.S.', sorting_order: 25200, in_the_eu: false },
          {id: 244, name: 'Vietnam', sorting_order: 25300, in_the_eu: false },
          {id: 245, name: 'Vanuatu', sorting_order: 25400, in_the_eu: false },
          {id: 246, name: 'Wallis and Futuna', sorting_order: 25500, in_the_eu: false },
          {id: 247, name: 'Yemen', sorting_order: 25600, in_the_eu: false },
          {id: 248, name: 'Mayotte', sorting_order: 25700, in_the_eu: false },
          {id: 249, name: 'South Africa', sorting_order: 25800, in_the_eu: false },
          {id: 250, name: 'Zambia', sorting_order: 25900, in_the_eu: false },
          {id: 251, name: 'Zimbabwe', sorting_order: 26000, in_the_eu: false },
          {id: 252, name: 'Kosovo', sorting_order: 26100, in_the_eu: false },
  ]

  countries.each do |c|
    Country.where(id: c[:id]).first_or_create(c.merge({currency_id: 1}))
    print '.'
  end
  counter = 100
  Country.order(:name).each do |c|
    c.sorting_order = counter
    c.save
    counter += 10
    print '.'
  end
  ireland = Country.where(name: 'Ireland').first
  ireland.sorting_order = 10; ireland.save
  uk = Country.where(name: 'United Kingdom').first
  uk.sorting_order = 20; uk.save
  usa = Country.where(name: 'United States').first
  usa.sorting_order = 30; usa.save
  can = Country.where(name: 'Canada').first
  can.sorting_order = 40; can.save

  puts ' Done'

  #==================================================
  print 'Assigning countries to currencies: '

  euro = Currency.where(name: 'Euro').first
  gbp  = Currency.where(name: 'Pounds Sterling').first
  usd  = Currency.where(name: 'US Dollar').first
  cad  = Currency.where(name: 'Canadian Dollar').first
  Country.where(in_the_eu: true).update_all(currency_id: euro.id)
  print '.'
  usa.update_attributes(currency_id: usd.id)
  print '.'
  can.update_attributes(currency_id: cad.id)
  print '.'
  uk.update_attributes(currency_id: gbp.id)
  print '.'

  puts ' Done'


  #==================================================
  print 'Users: '

  User.where(id: 1).first_or_create(
          name: 'Dan Laffan',
          email: 'dan.laffan@mac.com'
  ); print '.'
  User.where(id: 2).first_or_create(
          name: 'Lee Farrell',
          email: 'lee.farrell6@mail.dcu.ie'
  ); print '.'
  user_id = User.first.id

  puts ' DONE'

  #==================================================
  print 'Question Categories: '
  categories = [
          {id: 1, name: 'Sport', active: true,
           created_by: user_id,
           country_id: nil},
          {id: 2, name: 'Politics', active: true,
           created_by: user_id,
           country_id: nil},
          {id: 3, name: 'Music', active: true,
           created_by: user_id,
           country_id: nil},
  ]
  categories.each do |cat|
    QuestionCategory.where(id: cat[:id]).first_or_create(cat)
    print '.'
  end

  #==================================================
  print 'Questions: '
  questions = [
          {id: 1,
            question_category_id: 1,
            visible_text: "Who was Alonso's team mate at Ferrari in 2013?",
            correct_answer_id: 1,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Filipe Masse', sorting_order: 1},
                    {visible_text: 'Foghorn Leghorn', sorting_order: 2},
                    {visible_text: 'Chilton Pike', sorting_order: 3},
                    {visible_text: 'Michael Schumacher', sorting_order: 4}
            ]
          },
          {id: 2,
            question_category_id: 1,
            visible_text: "Who was Alonso's team mate at Ferrari in 2014?",
            correct_answer_id: 7,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Filipe Masse', sorting_order: 1},
                    {visible_text: 'Foghorn Leghorn', sorting_order: 2},
                    {visible_text: 'Kimi Raikonen', sorting_order: 3},
                    {visible_text: 'Michael Schumacher', sorting_order: 4}
            ]
          },
          {id: 3,
            question_category_id: 2,
            visible_text: 'Who replaced Charles Haughey as leader of Fianna Fáil?',
            correct_answer_id: 13,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Albert Reynolds', sorting_order: 1},
                    {visible_text: 'Bertie Ahern', sorting_order: 2},
                    {visible_text: 'Garret Fitzgerald', sorting_order: 3},
                    {visible_text: 'William Cosgrave', sorting_order: 4}
            ]
          },
          {id: 4,
            question_category_id: 2,
            visible_text: 'Who was the Prime Minister of the UK in 2013?',
            correct_answer_id: 16,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Mario Draghi', sorting_order: 1},
                    {visible_text: 'Neil Clegg', sorting_order: 2},
                    {visible_text: 'Gordon Brown', sorting_order: 3},
                    {visible_text: 'David Cameron', sorting_order: 4}
            ]
          },
          {id: 5,
            question_category_id: 3,
            visible_text: "Who had a hit with the song 'True'?",
            correct_answer_id: 19,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Sharon Corr', sorting_order: 1},
                    {visible_text: 'Shakin Stevens', sorting_order: 2},
                    {visible_text: 'Spandau Ballet', sorting_order: 3},
                    {visible_text: 'Spiro Gyra', sorting_order: 4}
            ]
          },
          {id: 6,
            question_category_id: 3,
            visible_text: "Astrud Gilberto had a hit with song about a 'Girl From...'",
            correct_answer_id: 21,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Ipanema', sorting_order: 1},
                    {visible_text: 'Up Above', sorting_order: 2},
                    {visible_text: 'Paris', sorting_order: 3},
                    {visible_text: 'Rio', sorting_order: 4}
            ]
          },
          {id: 7,
            question_category_id: 3,
            visible_text: "Who had a hit with 'Home Thoughts From Abroad'?",
            correct_answer_id: 28,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Issac Hayes', sorting_order: 1},
                    {visible_text: 'Chris Issacs', sorting_order: 2},
                    {visible_text: 'Cliff Richard', sorting_order: 3},
                    {visible_text: 'Clifford T. Ward', sorting_order: 4}
            ]
          },
          {id: 8,
            question_category_id: 3,
            visible_text: "Which musician was the voice of 'Chef' in South Park?",
            correct_answer_id: 30,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Ike Turner', sorting_order: 1},
                    {visible_text: 'Issac Hayes', sorting_order: 2},
                    {visible_text: 'Islam Josef', sorting_order: 3},
                    {visible_text: 'Joe Cocker', sorting_order: 4}
            ]
          },
          {id: 9,
            question_category_id: 3,
            visible_text: "Who had a hit with 'Running to Stand Still'?",
            correct_answer_id: 33,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Kate Bush', sorting_order: 1},
                    {visible_text: 'U2', sorting_order: 2},
                    {visible_text: 'Ultravox', sorting_order: 3},
                    {visible_text: 'The Chimes', sorting_order: 4}
            ]
          },
          {id: 10,
            question_category_id: 2,
            visible_text: "Who had a hit with the James Bond theme 'Live and Let Die'?",
            correct_answer_id: 40,
            created_by: user_id,
            updated_by: nil,
            publicly_visible: true,
            approved_by: user_id,
            question_answers_attributes: [
                    {visible_text: 'Gladys Knight', sorting_order: 1},
                    {visible_text: 'Carley Simon', sorting_order: 2},
                    {visible_text: 'Paul McCartney', sorting_order: 3},
                    {visible_text: 'Wings', sorting_order: 4}
            ]
          }
  ]
  questions.each do |qu|
    Question.where(id: qu[:id]).first_or_create!(qu)
    print '.'
  end

  puts ' DONE'

  #==================================================
  if Rails.env.development?
    print 'Venue: '
    Venue.where(id: 1).first_or_create(
            public_title: 'Oscars of Smithfield',
            address: 'Smithfield Square, Dublin 7, Ireland',
            latitude: 53.5,
            longitude: -6.1,
            created_by: 1,
            updated_by: nil,
            publicly_visible: true,
            approved_by: 1,
            time_zone: 'Dublin',
            logo_file_name: nil,
            logo_content_type: nil,
            logo_file_size: nil,
            logo_updated_at: nil)
    puts ' Done'
  end

  #==================================================
  if Rails.env.development?
    print 'Quiz Event (create #1): '
    QuizEvent.where(id: 1).first_or_create(
            name: 'School Fundraiser',
            description: 'To help raise funds for new computers for our school',
            time_zone: 'Dublin',
            starts_at: '2014-08-31 18:09:07',
            venue_id: Venue.first.id,
            created_by: User.first.id,
            updated_by: nil,
            event_guid: 'WKZEDcEP',
            sponsor_logo_url: nil)
    puts ' Done'
  end

  #==================================================
  if Rails.env.development?
    print 'Quiz Event (update starts_at) (dev only): '

    if Rails.env.development?
      QuizEvent.all.each do |qe|
        qe.update_attributes(starts_at: Time.now)
        print '.'
      end
    end
    puts ' Done'
  end

  #==================================================
  if Rails.env.development?
    print 'Quiz Rounds & QuizRoundQuestions: '

    categories = QuestionCategory.all

    categories.each_with_index do |category, counter_2|
      if category.questions.count > 0
        round = QuizRound.where(name: "#{category.name} Round").first_or_initialize(
                question_category_id: category.id,
                sorting_order: (counter_2 + 1) * 10,
                quiz_event_id: QuizEvent.first.id,
                created_by: user_id
        )
        round.save!; print ':'
        category.questions.each_with_index do |question, counter_3|
          QuizRoundQuestion.where(question_id: question.id, quiz_round_id: round.id).first_or_create!(
                  sorting_order: (counter_3 + 1) * 10,
                  time_limit_in_seconds: 10,
                  points_for_correct_answer: 10,
                  points_for_wrong_answer: -2,
                  points_for_no_answer: -1,
          ); print '.'
        end
      end
    end

    # (1..4).each do |round_number|
    #   QuizRound.where(id: round_number).first_or_create!(
    #           question_category_id: 1,
    #           sorting_order: round_number * 10,
    #           quiz_event_id: QuizEvent.first.id,
    #           created_by: User.first.id,
    #           name: "Quiz Round ##{round_number}"
    #   ); print '.'
    # end
    puts ' Done'
  end

  #==================================================
  if Rails.env.development?
    print 'Create some teams'

    Team.where(id: 1).first_or_create(
            quiz_event_id: QuizEvent.first.id,
            name: 'The Army Ants'
    ); print '.'
    Team.where(id: 2).first_or_create(
            quiz_event_id: QuizEvent.first.id,
            name: 'The Perpetual Motion Squad'
    ); print '.'
    Team.where(id: 3).first_or_create(
            quiz_event_id: QuizEvent.first.id,
            name: 'Team Discovery Channel'
    ); print '.'

    puts ' Done'
  end

  #==================================================
  if Rails.env.development?
    print 'EventTeamMembers (dev only): '
    # makes every user a member of every team.

    if Rails.env.development?
      User.all.map(&:id).each do |u_id|
        Team.all.map(&:id).each do |t_id|
          EventTeamMember.where(user_id: u_id, team_id: t_id).first_or_create!
          print '.'
        end
      end
    end

    puts ' Done'
  end

  #==================================================
  puts 'FINISHED.'
  puts '=' * 50

end
