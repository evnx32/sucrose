// enum of reusable enums

enum XenditReusablePaymentMethod { ONE_TIME_USE, MULTIPLE_USE }

enum XenditPaymentMethodType {
  EWALLET,
  DIRECT_DEBIT,
  CARD,
  VIRTUAL_ACCOUNT,
  OVER_THE_COUNTER,
  QR_CODE
}

enum XenditQRChannelCode { DANA, LINKAJA, PROMPTPAY }

enum XenditEWalletCode {
  DANA,
  OVO,
  LINKAJA,
  ASTRAPAY,
  JENIUSPAY,
  SHOPEEPAY,
  SAKUKU,
  GRABPAY,
  PAYMAYA,
  GCASH,
  APPOTA,
  MOMO,
  ZALOPAY,
  VNPTWALLET,
  VIETTELPAY,
  WECHATPAY,
  LINEPAY,
  TRUEMONEY,
}

enum XenditDirectDebitCode {
  SCB,
  KTB,
  BBL,
  BAY,
  KBANK_MB,
  BAY_MB,
  KTB_MB,
  SCB_MB,
  BPI,
  UBP,
  RCBC,
  CHINABANK,
  BDO_EPAY,
  BRI,
  MANDIRI,
  FPX,
}

enum XenditOTCCode {
  ALFAMART,
  INDOMARET,
  // SEVEN_ELEVEN,
  // SEVEN_ELEVEN_CLIQQ,
  CEBUANA,
  ECPAY,
  PALAWAN,
  MLHUILLIER,
  ECPAY_DRAGONLOAN,
  SM_BILLS,
  ROBINSONS_BILLS
}

enum XenditVAccountCode {
  BCA,
  BSI,
  BJB,
  CIMB,
  SAHABAT_SAMPOERNA,
  ARTAJASA,
  BRI,
  BNI,
  MANDIRI,
  PERMATA,
  PV,
  VIETCAPITAL,
  WOORI,
}

enum XenditOTCCurrency { PHP, IDR }

enum XenditQRCurrency { IDR, VND, THB }

enum XenditVACurrency { IDR, VND }

enum XenditCardCurrency { IDR, PHP, THB, MYR, VND, USD }

enum XenditEWalletCurrency { IDR, PHP, VND, THB }

enum XenditCurrency {
  PHP, // Philippines Peso
  IDR, // Indonesia Rupiah
  THB, // Thailand Baht
  VND, // Vietnam Dong
  MYR, // Malaysia Ringgit
  USD, // United States Dollar
}

enum XenditCustomerType {
  INDIVIDUAL,
  BUSINESS,
}

enum XenditPaymentMethodStatus {
  ACTIVE,
  INACTIVE,
}

enum XenditCustomerGender { MALE, FEMALE, OTHER }

enum XenditBusinessType {
  CORPORATION,
  SOLE_PROPRIETOR,
  PARTNERSHIP,
  COOPERATIVE,
  TRUST,
  NON_PROFIT,
  GOVERNMENT
}

enum XenditKycDocumentType {
  BIRTH_CERTIFICATE,
  BANK_STATEMENT,
  DRIVING_LICENSE,
  IDENTITY_CARD,
  PASSPORT,
  VISA,
  BUSINESS_REGISTRATION,
  BUSINESS_LICENSE
}

enum XenditAdressesCategory { HOME, WORK, PROVINCIAL }

enum XenditIdentityAccountType {
  BANK_ACCOUNT,
  EWALLET,
  CREDIT_CARD,
  PAY_LATER,
  OTC,
  QR_CODE,
  SOCIAL_MEDIA
}

enum XenditRefundReason {
  FRAUDULENT,
  DUPLICATE,
  REQUESTED_BY_CUSTOMER,
  CANCELLATION,
  OTHERS
}

enum XenditRefundCurrency { IDR, PHP }

enum XenditReedemPoints { REDEEM_NONE, REDEEM_ALL }

enum XenditAddressVerificationResult {
  MATCHED,
  NOT_MATCHED,
  NOT_MATCHED_NAME,
  PARTIAL_MATCH_ADDRESS,
  PARTIAL_MATCH_ZIP,
  PARTIAL_MATCH_NAME,
  INVALID,
  NOT_SUPPORTED,
  NOT_AVAILABLE,
  UNKNOWN_FROM_PROCESSOR
}

enum XenditCVVResult {
  MATCHED,
  NOT_MATCHED,
  NOT_PROCESSED,
  NOT_INCLUDED,
  VALIDATION_FAILED,
  SUSPICIOUS_TRANSACTION,
  NOT_SUPPORTED,
  UNKNOWN_FROM_PROCESSOR
}

enum XenditCardType {
  CREDIT,
  DEBIT,
}

enum XenditCardNetwork {
  VISA,
  MASTERCARD,
  JCB,
  AMEX,
}

enum XenditTreeDSecureFlow { CHALLENGE, FRICTIONLESS }

enum XenditTreeDSecureResult {
  SUCCESSFUL,
  ATTEMPTED,
  FAILED,
  NOT_AVAILABLE,
  PROCESSING_ERROR
}

enum XenditTreeDSecureResultReason {
  CARD_NOT_ENROLLED,
  NETWORK_NOT_SUPPORTED,
  ABANDONED,
  CANCELED,
  REJECTED,
  BYPASSED,
  PROCESSOR_ERROR
}

enum XenditDirectDebitType { DEBIT_CARD, BANK_ACCOUNT }

enum XenditPaymentRequestItemType {
  DIGITAL_PRODUCT,
  PHYSICAL_PRODUCT,
  DIGITAL_SERVICE,
  PHYSICAL_SERVICE,
  FEE,
  DISCOUNT
}
