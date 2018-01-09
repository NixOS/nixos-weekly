
def run(generators):
    for generator in generators:
        if isinstance(generator, ArticlesGenerator):
            for article in generator.articles:
                if type(article) in (Article, Draft, Page) and \
                   'image' in article.metadata:
                instance.featured_image = article.metadata['image']

def register():
    signals.all_generators_finalized.connect(run)
