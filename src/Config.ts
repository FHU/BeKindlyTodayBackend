import { GrantType } from '@kinde-oss/kinde-node-express';

export const inDev = process.env.NODE_ENV == 'dev';

export const kindeConfig = {
  clientId: process.env.KINDE_BACKEND_CLIENT_ID,
  issuerBaseUrl: process.env.KINDE_URL,
  siteUrl: process.env.SITE_URL,
  secret: process.env.KINDE_CLIENT_SECRET,
  redirectUrl: process.env.SITE_URL,
  scope: 'openid profile email',
  grantType: GrantType.AUTHORIZATION_CODE, //or CLIENT_CREDENTIALS or PKCE
  unAuthorisedUrl: process.env.UNAUTHORIZED_URL,
  postLogoutRedirectUrl: process.env.SITE_URL,
};

export const morganConfig: MorganConfig = {
  inDebug: process.env.DEBUG?.toLocaleLowerCase() === 'true',
  loggingLevel:
    process.env.DEBUG?.toLocaleLowerCase() === 'true' ? 'dev' : 'tiny', //This ugly was chosen because inDebug is not defined according to TS when this value is determined
};

interface MorganConfig {
  inDebug: boolean;
  loggingLevel: 'dev' | 'tiny';
}
