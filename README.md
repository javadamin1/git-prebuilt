# Git Prebuilt Binaries

Precompiled and portable Git binaries for major Linux distributions (Ubuntu, CentOS, Alpine), built directly from official Git source code.

## ✅ Available Builds

All builds are published in the [Releases](https://github.com/YOUR_USERNAME/git-prebuilt/releases) section.

Example assets:
- `git-2.44.0-ubuntu.tar.gz`
- `git-2.44.0-debian.tar.gz`
- `git-2.44.0-rocky.tar.gz`

---

## 🛠 Build Locally

You can build all three variants locally with:

```bash
./build.sh 2.44.0
```

Artifacts will be saved in the `artifacts/` directory.

---

## 📦 Dockerfiles

- `Dockerfile.ubuntu` → Ubuntu 20.04 build
- `Dockerfile.rocky` → Rocky 8 build

You can also build individually:

```bash
docker build --build-arg GIT_VERSION=2.44.0 -f Dockerfile.ubuntu -t git-ubuntu .
```

---

## 🔗 License

Git is licensed under [GNU GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

This project does **not** modify Git source code. It only builds and distributes official releases.
Source: https://github.com/git/git
