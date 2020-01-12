<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
// define( 'DB_NAME', 'wordpress-one' );
define( 'DB_NAME', 'wordpress_one' );

/** MySQL database username */
// define( 'DB_USER', 'wp' );
define( 'DB_USER', 'root' );

/** MySQL database password */
// define( 'DB_PASSWORD', 'wp' );
define( 'DB_PASSWORD', 'VohHMzRqBV4X' );

/** MySQL hostname */
// define( 'DB_HOST', 'localhost' );
define( 'DB_HOST', '127.0.0.1');

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          ',!E; idTVqG^+$n+Q>D61hWJ*)WW,M$fIAE2N6>j;| v#2%tU.lPGuqp]m`FFDg$' );
define( 'SECURE_AUTH_KEY',   '/wl/RNacZ@8,v4Zq+K{l9^Fu3Z%,DZblT}B2O4Ja;3#/xs?7!{3Lc0Rd/Y[n}4pa' );
define( 'LOGGED_IN_KEY',     'p8Us^A8M[MM|U-PDj<Pu(,|2jyt3`G<Gh%U#/*7VG&9?l$b#nZMShBY7KZI$o(Fg' );
define( 'NONCE_KEY',         'S/j-G11J;W#rYG}?tQpR|9eYLhFm:BgMd_s.q<_}FJ[<]kS)kAIcFMLsTAgINuk)' );
define( 'AUTH_SALT',         'H]++OU&^::|1QW4ho6I*IeS&l]fpo?!5Y-2/ZW:KPv{ojIIm;jESW$[=W~BTvyF+' );
define( 'SECURE_AUTH_SALT',  '5g0BycT9P3s-Q!{0lHs6J3Dx+C_G3P9V1Sr4JCt]Bnh@=b&WI9RvdUhW`6j7vE/]' );
define( 'LOGGED_IN_SALT',    '~ ^:e,&zh:Eesu6]Ycpp5{dF3 dH,M4nS6#SKx!#4cxxCo^.X,$<thtdq%eFrvFV' );
define( 'NONCE_SALT',        '6G<{p+x3>7RB|>DtdE3R5 `fu-+RDHswKUQj#xF wPnjh68Ib!5@j%Q=$uy9j+g+' );
define( 'WP_CACHE_KEY_SALT', '-_[%y(ZBvJ&0-G{?1n[:fdXHW}C>Cbn[:/t3DH7Lx#<BpLg*B@#HFRag@2ZQsl2^' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


define( 'WP_DEBUG', true );
define( 'SCRIPT_DEBUG', true );


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
