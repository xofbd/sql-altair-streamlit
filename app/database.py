import os

from sqlalchemy import create_engine, text

URL_DB = os.getenv("URL_DB")


def query_db(depth_min, grad_min):
    engine = create_engine(URL_DB)

    query = text(
        """
        SELECT latitude, longitude, depth, gradient
        FROM wells
        WHERE depth > :depth_min AND gradient > :grad_min;
        """
    )
    with engine.connect() as conn:
        return conn.execute(query, depth_min=depth_min, grad_min=grad_min).fetchall()


if __name__ == "__main__":
    import sys

    print(query_db(*sys.argv[1:]))