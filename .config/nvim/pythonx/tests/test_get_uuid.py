import re

from guiferviz_vim_helpers import get_uuid


def test_get_uuid_match_regex():
    for _ in range(10):
        assert re.match(
            "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",
            get_uuid(),
        )
