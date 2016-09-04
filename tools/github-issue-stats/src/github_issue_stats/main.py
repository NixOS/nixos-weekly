import argparse
import os
from pprint import pprint  # noqa
import logging
import dateutil.parser
from datetime import timedelta
import json
from . import github_issue_source

logging.basicConfig(level=logging.DEBUG)


def build_report(issue_source, owner_repo, report_begin, report_end):
    def in_range(date):
        date = dateutil.parser.parse(date)
        if report_begin < date and date < report_end:
            return True
        return False

    stats = {
        "new_issues": 0,
        "closed_issues": 0,
        "new_prs": 0,
        "closed_prs": 0
    }

    for issue in issue_source.issues_for(owner_repo, report_begin):
        is_pr = 'pull_request' in issue
        if issue['closed_at'] is not None:
            if in_range(issue['closed_at']):
                if is_pr:
                    stats['closed_prs'] += 1
                else:
                    stats['closed_issues'] += 1

        if in_range(issue['created_at']):
            if is_pr:
                stats['new_prs'] += 1
            else:
                stats['new_issues'] += 1

    return stats


def main():
    '''
    Magic Environment Variables:

     - GITHUB_API: https://api.github.com for changing to GH Enterprise
     - BE_A_BAD_GITHUB_CITIZEN: set to 1 to disable rate limiting. Instead
       of disabling rate limiting, you should authenticate to GitHub.
       Check out the .netrc example below.
     - REPORT_DURATION: How many days should the report be for? default: 7

    Notes:
     - report_date is forced to be at 00:00:00 in UTC on the used date

    Authenticating to GitHub? Create a file at ~/.netrc with:

        machine api.github.com
        login youruser
        password <api-key>
    '''

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description='Create a Github issue report',
        epilog=main.__doc__
    )

    parser.add_argument('project', type=str,
                        help='Example: NixOS/nixpkgs')
    parser.add_argument('report_date', type=str,
                        help='Date to run report for, ex: 2016-08-01')

    args = parser.parse_args()

    owner_repo = args.project
    report_end = dateutil.parser.parse(
        '{}T00:00:00Z'.format(args.report_date)
    )

    api_endpoint = os.environ.get('GITHUB_API', 'https://api.github.com')
    ignore_ratelimit = int(os.environ.get('BE_A_BAD_GITHUB_CITIZEN', 0)) != 0
    report_duration = int(os.environ.get('REPORT_DURATION', 7))

    report_begin = report_end - timedelta(days=report_duration)

    gh_client = github_issue_source.GithubIssueSource(
        base_url=api_endpoint,
        ignore_ratelimit=ignore_ratelimit
    )

    print(json.dumps(
        build_report(gh_client, owner_repo, report_begin, report_end),
        indent=4,
        sort_keys=True
    ))
