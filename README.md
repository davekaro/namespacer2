# README

Generate a new app, scaffold a few resources

```
rails new namespacer2
rails g scaffold webinar title:string
rails g scaffold webinars/position name:string
rails db:migrate
```

You can browse the code at this state here: https://github.com/davekaro/namespacer2/tree/140bf9d9d58314923f9ca6f453f89c11999906d2. `rails test` works - everything passes.

But, this is only because the fixtures defined in [fixtures/webinars/positions.yml](https://github.com/davekaro/namespacer2/blob/140bf9d9d58314923f9ca6f453f89c11999906d2/test/fixtures/webinars/positions.yml) are loaded first, and since they have the same keys as the fixtures in [fixtures/webinars.yml](https://github.com/davekaro/namespacer2/blob/140bf9d9d58314923f9ca6f453f89c11999906d2/test/fixtures/webinars.yml) (`one:` and `two:`), they are overridden when that files is read. See https://github.com/rails/rails/blob/v6.0.3.3/activerecord/lib/active_record/fixtures.rb#L687 where that happens.

So, if you add a new fixture to `fixtures/webinars/positions.yml` like https://github.com/davekaro/namespacer2/commit/73b150146ae6ef03e988a366c465d3df4a2b9380 and run `rails test` again, it blows up with:

```
ActiveRecord::Fixture::FixtureError: table "webinars" has no columns named "name".
```

And finally, the one workaround I thought of (besides renaming the module) was to move the fixture file around like https://github.com/davekaro/namespacer2/commit/c85247a053f7b70e8a71bd48d02a165f2e756fa5. Onec again, `rails test` passes.
