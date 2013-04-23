{*
 * =|= Layout ===================================================
 *
 * Master layout and structure of theme.
 * Includes theme's <head> and <body>, sidebars and footer.
 * ==============================================================
 *}

<!DOCTYPE html>
{* Conditionals elements for IE - see html5boilerplate *}
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="{$meta_language}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width">

        {* Title set in Back Office > Preferences > SEO & URLs. *}
        <title>{$meta_title|escape:'htmlall':'UTF-8'}</title>

        {* Meta description for SERPs. *}
        {if isset($meta_description) AND $meta_description}
            <meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
        {/if}

        {* Prestashop supports meta keywords, so little harm in including them here. (http://bit.ly/P4FuYL) *}
        {if isset($meta_keywords) AND $meta_keywords}
            <meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
        {/if}

        {* Robots settings set in Back office. Don't forget to generate a robots.txt too. *}
        <meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
        
        {* Favicon displayed in address bar, tabs and bookmarks. (http://bit.ly/P4F7xg) *}
        <link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
        <link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
        
        {* Icons for iOs devices. (http://bit.ly/15H8ikO) *}
        <link rel="apple-touch-icon" href="{$tpl_dir}/apple-touch-icon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{$tpl_dir}/apple-touch-icon-144x144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{$tpl_dir}/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{$tpl_dir}/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="{$tpl_dir}/apple-touch-icon-precomposed.png">

        {* Include all CSS files from page controller's SetMedia() *}
        {if isset($css_files)}
            {foreach from=$css_files key=css_uri item=media}
                <link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
            {/foreach}
        {/if}

        {* Required Prestashop JavaScript configuration. *}
        <script type="text/javascript">
            var baseDir               = '{$content_dir}';
            var baseUri               = '{$base_uri}';
            var static_token          = '{$static_token}';
            var token                 = '{$token}';
            var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
            var priceDisplayMethod    = {$priceDisplay};
            var roundMode             = {$roundMode};
        </script>

        {* HTML5Shiv enables HTML5 elements in older versions of Internet Explorer. (http://bit.ly/LX9S6f) *}
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

        {* Header modules hook *}
        {$HOOK_HEADER}
    </head>

    <body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{if $hide_left_column}hide-left-column{/if} {if $hide_right_column}hide-right-column{/if}">

        {* Message shown if country is restricted from viewing the store. *}
        {if isset($restricted_country_mode) && $restricted_country_mode}
            <div id="restricted-country">
                <p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
            </div>
        {/if}

        {* Header *}
        <header>
            <a id="logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
                <img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
            </a>
            <div class="modules">
                {$HOOK_TOP}
            </div>
        </header>

        {* Left sidebar *}
        <aside id="left_column" class="sidebar">
            {$HOOK_LEFT_COLUMN}
        </aside>

        {* Center content - Uses other template files. *}
        <div id="center_column">
            {if !empty($template)}
                {$template}
            {/if}
        </div>

        {* Right sidebar *}
        <aside id="right_column" class="sidebar">
            {$HOOK_RIGHT_COLUMN}
        </aside>

        {* Footer *}
        <footer>
            <div class="modules">
                {$HOOK_FOOTER}
            </div>
        </footer>
        
        {* Include all JavaScript files from page controller's SetMedia(). *}
        {if isset($js_files)}
            {foreach from=$js_files item=js_uri}
                <script type="text/javascript" src="{$js_uri}"></script>
            {/foreach}
        {/if}
    </body>
</html>

{* Includes overlay features when using Live Edit from the Back Office *}
{if !empty($live_edit)}
	{$live_edit}
{/if}