from setuptools import setup

setup(
    name="github-issue-stats",
    version="0.0.1",
    author="Graham Christensen",
    author_email="graham@grahamc.com",
    description=("Collect and report weekly stats of NixOS issues"),
    license="MIT",
    keywords="github issue statistics nixos",
    url="https://github.com/NixOS/nixos-weekly/",
    packages=['github_issue_stats'],
    entry_points={
        'console_scripts': [
            'github-issue-stats = github_issue_stats.main:main'
        ],
    },
    install_requires=[
        # Commented out because it wasn't working with buildPythonPackage
        # See default.nix for a more up to date version.
        #        'requests>2.11.0',
        #        'dateutil'
    ],
    test_suite="github_issue_stats"

)
