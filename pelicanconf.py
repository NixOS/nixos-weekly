# -*- coding: utf-8 -*- #

from __future__ import unicode_literals

# Options described here
# http://docs.getpelican.com/en/stable/settings.html


# Basic settings

USE_FOLDER_AS_CATEGORY = False
DEFAULT_CATEGORY = 'blog'
DELETE_OUTPUT_DIRECTORY = True
OUTPUT_PATH = 'output/'
PATH = 'content/'
SITENAME = 'NixOS Weekly'
SITEURL = 'http://weekly.nixos.org'
STATIC_PATHS = ['2017/images','2018/images']
WITH_FUTURE_DATES = False
SLUGIFY_SOURCE = 'basename'
#PLUGIN_PATHS = ['theme/plugins']
#PLUGINS = ['featured_image']


# URL settings

RELATIVE_URLS = True
ARTICLE_URL = '{date:%Y}/{slug}.html'
ARTICLE_SAVE_AS = '{date:%Y}/{slug}.html'
ARTICLE_LANG_URL = ''
ARTICLE_LANG_SAVE_AS = ''
DRAFT_URL = 'drafts/{slug}.html'
DRAFT_SAVE_AS = 'drafts/{slug}.html'
DRAFT_LANG_URL = ''
DRAFT_LANG_SAVE_AS = ''
PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = '{slug}.html'
PAGE_LANG_URL = ''
PAGE_LANG_SAVE_AS = ''
CATEGORY_URL = ''
CATEGORY_SAVE_AS = ''
TAG_URL = ''
TAG_SAVE_AS = ''
AUTHOR_URL = ''
AUTHOR_SAVE_AS = ''
YEAR_ARCHIVE_SAVE_AS = '{date:%Y}/index.html'
MONTH_ARCHIVE_SAVE_AS = ''
DAY_ARCHIVE_SAVE_AS = ''


# Time and Date

TIMEZONE = 'Europe/Berlin'


# Metadata

AUTHOR = 'NixOS Weekly Team'


# Feed settings

FEED_ALL_ATOM = 'feeds/all.atom.xml'
FEED_ALL_RSS = 'feeds/all.rss.xml'
CATEGORY_FEED_ATOM = None
CATEGORY_FEED_RSS = None
TAG_FEED_ATOM = None
TAG_FEED_RSS = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None
TRANSLATION_FEED_ATOM = None
RSS_FEED_SUMMARY_ONLY = False
ATOM_FEED_SUMMARY_ONLY = False


# Translations

DEFAULT_LANG = 'en'


# Themes

THEME = 'theme'


# Jinja

def group_articles_by_year(articles):
    groupped = {}
    for article in articles:
        groupped.setdefault(article.date.year, [])
        groupped[article.date.year].append(article)
    return sorted(groupped.items(), key=lambda x: x[0], reverse=True)

JINJA_FILTERS = {
    'group_articles_by_year': group_articles_by_year,
}
