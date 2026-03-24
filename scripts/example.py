"""Beispielskript zur Datenvorverarbeitung."""

import pandas as pd

from project.utils import DATA_DIR


def main():
    raw_file = DATA_DIR / "raw" / "measurements.csv"
    print(f"Lade Daten aus {raw_file} …")

    # df = pd.read_csv(raw_file)
    # df_clean = df.dropna()
    # df_clean.to_csv(DATA_DIR / "processed" / "measurements_clean.csv", index=False)


if __name__ == "__main__":
    main()
