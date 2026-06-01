---
layout: post
title: Concentration Inequalities for Reinforcement Learning
date: 2026-01-31 00:00:00
published: true
description: A summary of key concentration inequalities used in the analysis of reinforcement learning algorithms.
tags: [machine-learning, reinforcement-learning, mathematics, probability]
categories: [theory]
related_posts: false
toc:
  sidebar: left
---

This note collects concentration inequalities that frequently appear in reinforcement learning analysis. It is meant as a working reference rather than a complete survey.

## 1. Markov inequality and Chernoff bound

If $$X$$ is a nonnegative random variable and $$a>0$$, then the probability that $$X$$ is at least $$a$$ is at most the expectation of $$X$$ divided by $$a$$:

$$

\mathrm{P}(X \geq a) \leq \frac{\mathrm{E}(X)}{a}


$$

In probability theory, Markov's inequality gives an upper bound on the probability that a non-negative random variable is greater than or equal to some positive constant. Markov's inequality is tight in the sense that for each chosen positive constant, there exists a random variable such that the inequality is in fact an equality.

The generic Chernoff bound for a random variable $$X$$ is attained by applying Markov's inequality to $$e^{t X}$$ (which is why it is sometimes called the exponential Markov or exponential moments bound). For positive $$t$$ this gives a bound on the right tail of $$X$$ in terms of its moment-generating function $$M(t)=\mathrm{E}\left(e^{t X}\right)$$:

$$

\mathrm{P}(X \geq a)=\mathrm{P}\left(e^{t X} \geq e^{t a}\right) \leq M(t) e^{-t a} \quad(t>0)


$$

Chernoff bound is an exponentially decreasing upper bound on the tail of a random variable based on its moment generating function.

It is a sharper bound than the first- or second-moment-based tail bounds such as Markov's inequality or [Chebyshev's inequality](https://en.wikipedia.org/wiki/Chebyshev%27s_inequality "Chebyshev's inequality"), which only yield power-law bounds on tail decay. However, when applied to sums the Chernoff bound requires the random variables to be independent, a condition that is not required by either Markov's inequality or Chebyshev's inequality.

The Chernoff bound is related to the Bernstein inequalities. It is also used to prove Hoeffding's inequality, Bennett's inequality, and [McDiarmid's inequality](https://en.wikipedia.org/wiki/Doob_martingale#McDiarmid's_inequality "Doob martingale").

## 2. Hoeffding's inequality

Suppose $$X_{1}, X_{2}, \ldots, X_{n}$$ are a sequence of independent, identically distributed (i.i.d.) random variables with mean $$\mu$$. Let $$\bar{X}_{n} = n^{-1}\sum_{i=1}^{n}X_{i}$$. Suppose that $$X_{i} \in [b_{-}, b_{+}]$$ with probability 1, then

$$

P (\bar {X} _ {n} \geq \mu + \epsilon) \leq e ^ {- 2 n \epsilon^ {2} / (b _ {+} - b _ {-}) ^ {2}}.


$$

Similarly,

$$

P (\bar {X} _ {n} \leq \mu - \epsilon) \leq e ^ {- 2 n \epsilon^ {2} / (b _ {+} - b _ {-}) ^ {2}}.


$$

The Chernoff bound implies that with probability $$1 - \delta$$:

$$

\bar {X} _ {n} - E X \leq (b _ {+} - b _ {-}) \sqrt {\ln (1 / \delta) / (2 n)}.


$$

Hoeffding's inequality is a special case of the Azuma–Hoeffding inequality and [McDiarmid's inequality](https://en.wikipedia.org/wiki/McDiarmid%27s_inequality "McDiarmid's inequality"). It is similar to the Chernoff bound, but tends to be less sharp, in particular when the variance of the random variables is small.

## 3. Sub-Gaussian Random Variable

A random variable $$X$$ is $$\sigma$$-subGaussian if for all $$\lambda \in \mathbb{R}$$, it holds that $$\mathbb{E}[\exp (\lambda X)] \leq \exp (\lambda^2\sigma^2 / 2)$$.

One can show that a Gaussian random variable with zero mean and standard deviation $$\sigma$$ is a $$\sigma$$-subGaussian random variable.

The following theorem shows that the tails of a $$\sigma$$-subGaussian random variable decay approximately as fast as that of a Gaussian variable with zero mean and standard deviation $$\sigma$$.

The following lemma shows that the sum of independent sub-Gaussian variables is still sub-Gaussian.

**Lemma 1.** Suppose that $$X_{1}$$ and $$X_{2}$$ are independent and $$\sigma_{1}$$ and $$\sigma_{2}$$ subGaussian, respectively. Then for any $$c \in \mathbb{R}$$, we have $$cX$$ being $$\vert c \vert \sigma$$-subGaussian. We also have $$X_{1} + X_{2}$$ being $$\sqrt{\sigma_1^2 + \sigma_2^2}$$-subGaussian.

## 4. Hoeffding-Azuma Inequality

**Definition 1 (Martingale Difference Sequence, M. D. S.).** A sequence of random variables $$\{X_{n}\}_{n=1}^{\infty}$$ is called a martingale difference sequence, or m. d. s., with respect to a filtration $$\{\mathcal{F}_{n}\}_{n=0}^{\infty}$$ if for all $$n, \mathbb{E}[\vert X_{n}\vert]<\infty, X_{n} \in \mathcal{F}_{n}$$, and $$\mathbb{E}[X_{n} \mid \mathcal{F}_{n-1}]=0$$ hold.

As the name implies, the sum sequence of a martingale difference sequence is called a martingale.

The Azuma-Hoeffding inequality provides an exponentially decaying tail bound for the sum of a martingale difference sequence:

Suppose $$X_{1},\ldots ,X_{N}$$ is a martingale difference sequence where each $$X_{i}$$ is a $$\sigma_i$$ sub-Gaussian. Then, for all $$\epsilon >0$$ and all positive integer $$K$$:

$$

P \left(\sum_ {i = 1} ^ {K} X _ {i} \geq \epsilon\right) \leq \exp \left(\frac {- \epsilon^ {2}}{2 \sum_ {i = 1} ^ {K} \sigma_ {i} ^ {2}}\right).


$$

## 5. Bernstein's Inequality

**Lemma 2 (Bernstein's inequality).** Suppose $$X_{1},\ldots ,X_{n}$$ are independent random variables. Let $$\bar{X}_n = n^{-1}\sum_{i = 1}^n X_i$$, $$\mu = \mathbb{E}\bar{X}_n$$, and $$Var(X_{i})$$ denote the variance of $$X_{i}$$. If $$X_{i} - EX_{i}\leq b$$ for all $$i$$, then

$$

P (\bar {X} _ {n} \geq \mu + \epsilon) \leq \exp \left[ - \frac {n ^ {2} \epsilon^ {2}}{2 \sum_ {i = 1} ^ {n} \operatorname {V a r} (X _ {i}) + 2 n b \epsilon / 3} \right].


$$

If all the variances are equal, the Bernstein inequality implies that, with probability at least $$1 - \delta$$,

$$

\bar {X} _ {n} - E X \leq \sqrt {2 \mathrm {V a r} (X) \ln (1 / \delta) / n} + \frac {2 b \ln (1 / \delta)}{3 n}.


$$

**Lemma 3 (Bernstein's Inequality for Martingales).** Suppose $$X_{1}, X_{2} \ldots$$ is a martingale difference sequence where $$\vert X_{i}\vert \leq M \in \mathbb{R}^{+}$$ almost surely. Then for all positive $$t$$ and $$n \in \mathbb{N}^{+}$$, we have:

$$

P \left(\sum_ {i = 1} ^ {n} X _ {i} \geq t\right) \leq \exp \left(- \frac {t ^ {2} / 2}{\sum_ {i = 1} ^ {n} \mathbb {E} \left[ X _ {i} ^ {2} \mid \mathcal{F}_{i-1} \right] + M t / 3}\right).


$$

## 6. Concentration for Discrete Distributions

Let $$z$$ be a discrete random variable that takes values in $$\{1,\dots ,d\}$$, distributed according to $$q$$. We write $$q$$ as a vector where $$\vec{q} = [\mathrm{Pr}(z = j)]_{j = 1}^{d}$$. Assume we have $$N$$ i. i. d samples, and that our empirical estimate of $$\vec{q}$$ is $$[\hat{q}]_j = \sum_{i = 1}^N\mathbf{1}[z_i = j] / N$$.

We have that $$\forall \epsilon > 0$$:

$$

\Pr \left(\| \widehat {q} - \bar {q} \| _ {2} \geq 1 / \sqrt {N} + \epsilon\right) \leq e ^ {- N \epsilon^ {2}}.


$$

which implies that:

$$

\operatorname * {P r} \left(\| \widehat {q} - \overline {{q}} \| _ {1} \geq \sqrt {d} (1 / \sqrt {N} + \epsilon)\right) \leq e ^ {- N \epsilon^ {2}}.


$$

This result illustrates that the $$L_2$$ bound is tighter than the $$L_1$$ bound by roughly $$\sqrt{d}$$. Geometrically, this stems from the fact that the $$L_2$$ norm is Euclidean distance (straight line), whereas the $$L_1$$ norm is Manhattan distance (grid path). Thus the $$L_1$$ bound incurs an additional $$\sqrt{d}$$ factor in the worst case.

Intuitively, for any fixed vector, a higher-order norm yields a smaller value (i.e., tighter distance). We have the following relationship for $$x \in \mathbb{R}^{d}$$:

$$

\|x\|_{\infty} \leq\|x\|_{2} \leq\|x\|_{1} \leq \sqrt{d}\|x\|_{2} \leq d\|x\|_{\infty}.


$$

## 7. Self-Normalized Bound for Vector-Valued Martingales

Let $$\{\varepsilon_i\}_{i=1}^{\infty}$$ be a real-valued stochastic process with corresponding filtration $$\{\mathcal{F}_i\}_{i=1}^{\infty}$$ such that $$\varepsilon_i$$ is $$\mathcal{F}_i$$ measurable, $$\mathbb{E}[\varepsilon_i \mid \mathcal{F}_{i-1}] = 0$$ and $$\varepsilon_i$$ is conditionally $$\sigma$$-subGaussian with $$\sigma \in \mathbb{R}^+$$. Let $$\{X_i\}_{i=1}^{\infty}$$ be a stochastic process with $$X_i \in \mathcal{H}$$ (some Hilbert space) and $$X_i$$ being $$\mathcal{F}_t$$ measurable. Assume that a linear operator $$\Sigma: \mathcal{H} \to \mathcal{H}$$ is positive definite, i.e., $$x^\top \Sigma x > 0$$ for any $$x \in \mathcal{H}$$. For any $$t$$, define the linear operator $$\Sigma_t = \Sigma_0 + \sum_{i=1}^{t} X_i X_i^\top$$ (here $$xx^\top$$ denotes outer-product in $$\mathcal{H}$$). With probability at least $$1 - \delta$$, we have for all $$t \geq 1$$:

$$

\left\| \sum_ {i = 1} ^ {t} X _ {i} \varepsilon_ {i} \right\| _ {\Sigma_ {t} ^ {- 1}} ^ {2} \leq \sigma^ {2} \log \left(\frac {\det (\Sigma_ {t}) \det (\Sigma_ {0}) ^ {- 1}}{\delta^ {2}}\right).


$$

## References

[1] Agarwal, A., Jiang, N., Kakade, S. M. & Sun, W. (2022). [Reinforcement Learning: Theory and Algorithms](https://rltheorybook.github.io/).
[2] Wikipedia. [Markov's inequality](https://en.wikipedia.org/wiki/Markov%27s_inequality).
[3] Wikipedia. [Chernoff bound](https://en.wikipedia.org/wiki/Chernoff_bound).
[4] Wikipedia. [Hoeffding's inequality](https://en.wikipedia.org/wiki/Hoeffding%27s_inequality).
[5] Harin Lee. [Freedman's Inequality](https://harinboy.github.io/posts/FreedmansInequality/).
