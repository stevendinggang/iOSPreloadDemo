
### iOS 优化细节介绍

异步图片加载和缓存管理
图片预加载：UITableViewDataSourcePrefetching协议被用于预加载图片。这允许在用户滚动到特定行之前，提前加载这些行的图片，提高用户体验。

操作队列管理：使用OperationQueue来异步下载图片，避免了在主线程上加载图片时可能出现的UI卡顿问题。

取消不必要的加载：通过实现cancelPrefetchingForRowsAt方法，当某些行不再需要显示时，取消这些行图片的加载，节省资源。

### 数据和UI更新管理
分页加载：通过判断需要预取的indexPaths，当接近当前数据集的末尾时，触发更多数据的加载（分页加载）。

渐进式数据更新：在onFetchCompleted代理方法中，使用visibleIndexPathsToReload函数来计算哪些行是可见的，并且需要重新加载，而不是简单地重新加载整个表格视图。

错误处理：onFetchFailed方法提供了一个处理错误的机制，比如当图片加载失败时，可以在这里实现错误处理逻辑。

### UI组件和用户体验
活动指示器：使用UIActivityIndicatorView来向用户展示数据正在加载的状态。

自定义TableViewCell：ProloadTableViewCell用于自定义行的显示，允许对图片显示和布局进行更多控制。

### ImageCache 类
单例模式：使用了单例模式来确保全局只有一个图片缓存实例。减少了内存的使用和管理复杂性。

类型安全：NSCache 使用 AnyObject 作为键和值的类型。

### DataLoadOperation 类
继承自 Operation：这允许将加载操作放入一个操作队列中，便于管理并发和依赖。

处理取消操作：在 main 方法中检查 isCancelled 属性，它允许在操作被取消时及时停止进一步的处理。

线程安全：在 downloadImageFrom 方法中。

错误处理：目前的实现没有处理网络请求中可能发生的错误。添加错误处理逻辑，例如在加载失败时调用回调函数，可以提高代码的健壮性。

异步下载：使用 URLSession 进行异步下载

缓存策略：在下载之前检查缓存。
