VERSION := "v$$(cat buildpack.toml | grep version | sed -e 's/version = //g' | xargs)"

clean:
	-rm -f evergreen-node-system-function-buildpack-$(VERSION).tgz

package: clean
	@tar cvzf evergreen-node-system-function-buildpack-$(VERSION).tgz bin/ src/ buildpack.toml README.md LICENSE

release:
	@git tag $(VERSION)
	@git push --tags origin master
