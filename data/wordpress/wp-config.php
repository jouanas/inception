<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'sjouan' );

/** Database password */
define( 'DB_PASSWORD', 'SalmaJouan2225@.' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'rWzno`O/sG5jOJ@YhMn4?<x+me^(~Ytvx*Ue3~Mg9J#:MR+3m@j=LH&F0pD:-C/O' );
define( 'SECURE_AUTH_KEY',   'M`d:JW-?nR~8Uf+2@@6:.1Kyy,BFc11jv&B4P4[ZTuwQ@y?Wr{5PJ71-adq|ns-1' );
define( 'LOGGED_IN_KEY',     'g=qoA~d?]_xF{KUpG%k_1lN?WV<%&ZT5^TR,#hOf96>j,VROe|-JQv`HAdH(;|p<' );
define( 'NONCE_KEY',         '6165/`C(=X|7=0+ZuXV[{:cS#mP(|&x_.zaDMjcQhO>XXqXLF2d^dgL.1E`j<Q1Q' );
define( 'AUTH_SALT',         '-#.CPeY*%4SW lX{k_/?m1@!TL1f&,k[g% <Q%q~Af;t8w8/nf%BF%`l5n;d#Ecr' );
define( 'SECURE_AUTH_SALT',  '[x1}:T DDNBagS[/0)mRb`{{aAE<I}w}0wD1L95SdGqN&B;}cF,?y3&k6xKrb!h/' );
define( 'LOGGED_IN_SALT',    'U%r,mDhvA8DlVclaOurx]`Nk3z)<~!P6sLPDe`goxV~JJ,:fjT=[.lP47sLzo91m' );
define( 'NONCE_SALT',        'Jz=!W/k{$uY[p7F-zQIR4s|vheL@?l<CUMYakI>-/(:`B+pc@Z}/Px2-B%Za.b_>' );
define( 'WP_CACHE_KEY_SALT', '5Y`$(9?CWo9bTpptn1~G>D(gX*Lf3]d6v(v0go%QB!*//%}-D@pF*O067G2o5n5:' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
