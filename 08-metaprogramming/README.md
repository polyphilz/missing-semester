# Lecture 8 - Metaprogramming

## Exercises

### Exercise 1

Task: Implement a `clean` target for the `paper.pdf` `Makefile`.

Answer:

```
.PHONY: clean
clean:
	git ls-files -o | xargs rm -f
```

Reasoning: We can use `git ls-files` coupled with the `-o / --others` flag to show other (untracked) files in the output. We can then pipe these files into `rm -f` with `xargs`. This is dependent on the original dependencies being committed to Git in the first place.

### Exercise 2

Task: For each way of specifying version requirements for dependencies in Rust's build system, come up with a use-case in which that particular kind of requirement makes sense.

Answer:

#### 1. Caret requirements

Caret requirements are what I envision is used most of the time (and at least in the Rust ecosystem, this is enforced because dependencies defined without requirements are defaulted to a prefixed caret). It's the sort of catch-all. For example, `^1.2.3` makes sense if version `1.2.3` is the version you used when you were initially building your software that depends on this library. In this case, we don't care if new things are added (and minor is incremented) or if there are some patches. As long as our code is never at risk of breaking (which it won't be if we don't get updated to major 2+, we should be fine with updates.

#### 2. Tilde requirements

Tilde requirements are a tad more restrictive than caret requirements. We may use `~1.2.3` if we know of issues in the `>=1.3.0` releases that we do not want to introduce to our code.

#### 3. Wildcard requirements

A wildcard would make sense for multiple scenarios (ex: we're using a dependency only for development - ie `nodemon` - and don't care which version we have at all), or if we're paranoid about additions to the external API of our dependencies but can tolerate patch changes.

#### 4. Comparison requirements

We could use a comparison requirement if we have a range in mind of what's okay. For example, let's say we're using a very minor subset of some dependency at version `1.1.1`. Version `2.0.0` is released of this dependency, and does *not* introduce any breaking changes for us, and in fact includes some nice security additions. Eventually, `3.1.1` is released which does break things for us. We could then do `<3.1.1` to take advantage of feature from major 1 and security upgrades in major 2.

#### 5. Multiple requirements

Like comparison requirements but even more specific.

### Exercise 3

Skipped.

### Exercise 4

Skipped.

### Exercise 5

Skipped.
